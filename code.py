# Based on https://github.com/TeachMePCB/MacroKeypad/blob/main/Source/code.py

import time
import busio
import board
import displayio
import rotaryio
import digitalio
import neopixel
from digitalio import DigitalInOut, Direction, Pull
import usb_hid
from adafruit_hid.keyboard import Keyboard
from adafruit_hid.keycode import Keycode
from adafruit_hid.consumer_control import ConsumerControl
from adafruit_hid.consumer_control_code import ConsumerControlCode
from adafruit_debouncer import Debouncer
from adafruit_bus_device.spi_device import SPIDevice
from lib.fergcorp_pca9745b import PCA9745B
import adafruit_veml7700
from lib.fergcorp_pdispectra import PDISpectra

displayio.release_displays()

kbd = Keyboard(usb_hid.devices)
cc = ConsumerControl(usb_hid.devices)

#Colors
RED = (255, 0, 0)
RED_YELLOW = (255, 128, 0)  # Orange
YELLOW = (255, 255, 0)
YELLOW_GREEN = (128, 255, 0)  # Chartreuse

GREEN = (0, 255, 0)
GREEN_CYAN = (0, 255, 128)  # Spring Green
CYAN = (0, 255, 255)
CYAN_BLUE = (0, 128, 255)  # Azure

BLUE = (0, 0, 255)
BLUE_MAGENTA = (128, 0, 255)  # Violet
MAGENTA = (255, 0, 255)
MAGENTA_RED = (255, 0, 128)  # Rose

WHITE = (255, 255, 255)
OFF = (0, 0, 0)


# Key type (determine what type of command is used)
MEDIA = 1
KEY = 2

# key type, keycode, normal color, color when pushed
KEYMAP = {
    (1): (KEY, [Keycode.OPTION, Keycode.SHIFT, Keycode.MINUS], CYAN, RED), # EM Dash
    (2): (KEY, [Keycode.OPTION, Keycode.MINUS], CYAN_BLUE, RED_YELLOW),  # EN Dash
    (3): (KEY, [Keycode.OPTION, Keycode.TWO], BLUE, YELLOW),  # ™
    (4): (KEY, [Keycode.COMMAND, Keycode.SHIFT, Keycode.THREE], BLUE_MAGENTA, YELLOW_GREEN),  # Screenshot entire screen
    (5): (KEY, [Keycode.COMMAND, Keycode.SHIFT, Keycode.FOUR], MAGENTA, GREEN),  # Screenshot selection
    (6): (KEY, [Keycode.F11], MAGENTA_RED, GREEN_CYAN),  # Show Desktop
    (7): (KEY, [Keycode.COMMAND, Keycode.X], RED, CYAN),  # CUT
    (8): (KEY, [Keycode.COMMAND, Keycode.C], RED_YELLOW, CYAN_BLUE),  # COPY
    (9): (KEY, [Keycode.COMMAND, Keycode.V], YELLOW, BLUE),  # PASTE
    (0): (KEY, [Keycode.LEFT_CONTROL, Keycode.COMMAND, Keycode.Q], WHITE, RED),  # Lock screen
    (10): (MEDIA, [Keycode.CAPS_LOCK]),  # Mute
    (11): (MEDIA, [ConsumerControlCode.MUTE]),  # Mute
}

BUTTON_TO_NEOPIXEL = {
    0: 0,
    1: 1,
    2: 2,
    3: 3,
    4: 6,
    5: 5,
    6: 4,
    7: 7,
    8: 8,
    9: 9,
}

# list of pins to use (skipping GP15 on Pico because it's funky)
PINS = [
    board.GP1,  # E-Button
    board.GP2,  # Button 1
    board.GP7,  # Button 2
    board.GP10,  # Button 3
    board.GP3,  # Button 4
    board.GP6,  # Button 5
    board.GP9,  # Button 6
    board.GP4,  # Button 7
    board.GP5,  # Button 8
    board.GP8,  # Button 9
    board.GP22,  # Top Rotary
    board.GP26,  # Bottom Rotary
]

SWITCHES = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
PIN_SETUP = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

PIN_SETUP[10] = digitalio.DigitalInOut(board.GP22)
PIN_SETUP[10].direction = Direction.INPUT
PIN_SETUP[10].pull = Pull.DOWN
SWITCHES[10] = Debouncer(PIN_SETUP[10])

PIN_SETUP[11] = digitalio.DigitalInOut(board.GP26)
PIN_SETUP[11].direction = Direction.INPUT
PIN_SETUP[11].pull = Pull.DOWN
SWITCHES[11] = Debouncer(PIN_SETUP[11])

switch_state = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

# Update this to match the number of NeoPixel LEDs connected to your board.
NUM_NEOPIXELS = 10

NEOPIXEL_BRIGHTNESS_STEPS = 50
pixelBrightness = NEOPIXEL_BRIGHTNESS_STEPS / 2

NEO_PIXELS = neopixel.NeoPixel(board.GP0, NUM_NEOPIXELS)
NEO_PIXELS.brightness = float(pixelBrightness) / NEOPIXEL_BRIGHTNESS_STEPS

topEncoder = rotaryio.IncrementalEncoder(board.GP14, board.GP15, divisor=4)
topEncoder_last_position = topEncoder.position

bottomEncoder = rotaryio.IncrementalEncoder(board.GP28, board.GP27)
bottomEncoder_last_position = bottomEncoder.position

displayio.release_displays()
spi_bus = busio.SPI(clock=board.GP18, MOSI=board.GP19, MISO=board.GP16)

eink_driver_cs = board.GP17
eink_driver_d_c = board.GP12
eink_driver_busy = board.GP11
eink_driver_res = board.GP2

display_bus = displayio.FourWire(
    spi_bus,
    command=eink_driver_d_c,
    chip_select=eink_driver_cs,
    reset=eink_driver_res,
#    baudrate=100000,
)

display = PDISpectra(
    display_bus,
    height=152,
    width=152,
    rotation=90,
    busy_pin=eink_driver_busy,
    swap_rams=False,
)

g = displayio.Group()

'''
with open("/macrokeyboard.bmp", "rb") as f:
    pic = displayio.OnDiskBitmap(f)
    # CircuitPython 6 & 7 compatible
    t = displayio.TileGrid(
        pic, pixel_shader=getattr(pic, "pixel_shader", displayio.ColorConverter())
    )
    # CircuitPython 7 compatible only
    #t = displayio.TileGrid(pic, pixel_shader=pic.pixel_shader)
    g.append(t)

    display.show(g)

    display.refresh()
'''

displayio.release_displays()

eink_driver_cs = digitalio.DigitalInOut(board.GP17)
eink_driver_cs.direction = Direction.OUTPUT
eink_driver_cs.value = True

for i in range(10):
    PIN_SETUP[i] = DigitalInOut(PINS[i])
    PIN_SETUP[i].direction = Direction.INPUT
    PIN_SETUP[i].pull = Pull.UP
    SWITCHES[i] = Debouncer(PIN_SETUP[i])

# PCA9745B RGB LED Driver Setup
led_driver_cs = digitalio.DigitalInOut(board.GP13)
led_driver_cs.direction = Direction.OUTPUT
led_driver = SPIDevice(spi_bus, led_driver_cs, baudrate=500000, phase=0, polarity=0)

led = PCA9745B(spi_bus, led_driver_cs, debug=True)

print("Error status: %s" % led.error_flag_exist())
led.reset()
led.clear()


led.set_gain_all(0x58)
led.set_led_mode_by_group(0, 0x00)
led.set_led_mode_by_group(1, 0x00)

led.set_led_by_group(0, *RED)
led.set_led_by_group(1, RED[2], RED[1], RED[0])

# Initialized colors of buttons
for button in range(10):
    NEO_PIXELS[BUTTON_TO_NEOPIXEL[button]] = (KEYMAP[button][3][0], KEYMAP[button][3][1], KEYMAP[button][3][2])


led_status = {
    "Num Lock": Keyboard.LED_NUM_LOCK,
    "Caps Lock": Keyboard.LED_CAPS_LOCK,
    "Scroll Lock": Keyboard.LED_SCROLL_LOCK,
    "Compose": Keyboard.LED_COMPOSE,
    "Power": 0x06,
    "Shift": 0x07,
    "Do Not Disturb": 0x08,
    "Mute": 0x09,
    "Camera On": 0x28,
    "Camera Off": 0x29,
}

led_status_prior = {}




while True:
    for button in range(10):
        SWITCHES[button].update()
        if SWITCHES[button].fell:
            NEO_PIXELS[BUTTON_TO_NEOPIXEL[button]] = (KEYMAP[button][2][0], KEYMAP[button][2][1], KEYMAP[button][2][2])
            kbd.send(*KEYMAP[button][1])
            #kbd.press(*keymap[button][1])

            print("Key: %s" % button)
        elif SWITCHES[button].rose:
            NEO_PIXELS[BUTTON_TO_NEOPIXEL[button]] = (KEYMAP[button][3][0], KEYMAP[button][3][1], KEYMAP[button][3][2])
            #kbd.release(*keymap[button][1])

    for button in range(10, 12):
        SWITCHES[button].update()
        if SWITCHES[button].fell:
            #NEO_PIXELS[BUTTON_TO_NEOPIXEL[button]] = (KEYMAP[button][2][0], KEYMAP[button][2][1], KEYMAP[button][2][2])
            print("Key: %s" % button)
            if KEYMAP[button][0] == KEY:
                kbd.press(*KEYMAP[button][1])
            elif KEYMAP[button][0] == MEDIA:
                cc.send(*KEYMAP[button][1])
        elif SWITCHES[button].rose:
            pass
            #NEO_PIXELS[BUTTON_TO_NEOPIXEL[button]] = (KEYMAP[button][3][0], KEYMAP[button][3][1], KEYMAP[button][3][2])

    current_position = topEncoder.position
    position_change = current_position - topEncoder_last_position
    if position_change > 0:
        print(current_position)
        for _ in range(position_change):
            if (pixelBrightness < NEOPIXEL_BRIGHTNESS_STEPS):
                pixelBrightness = pixelBrightness + 1
        print(pixelBrightness)
        NEO_PIXELS.brightness = float(pixelBrightness) / NEOPIXEL_BRIGHTNESS_STEPS
    elif position_change < 0:
        print(current_position)
        for _ in range(-position_change):
            if (pixelBrightness > 0):
                pixelBrightness = pixelBrightness - 1
        print(pixelBrightness)
        NEO_PIXELS.brightness = float(pixelBrightness) / NEOPIXEL_BRIGHTNESS_STEPS
    topEncoder_last_position = current_position

    current_position = bottomEncoder.position
    position_change = current_position - bottomEncoder_last_position

    if position_change > 0:
        print(current_position)
        for _ in range(position_change):
            if (pixelBrightness < NEOPIXEL_BRIGHTNESS_STEPS):
                pixelBrightness = pixelBrightness + 1
                cc.send(ConsumerControlCode.VOLUME_INCREMENT)
        print(pixelBrightness)
        NEO_PIXELS.brightness = float(pixelBrightness) / NEOPIXEL_BRIGHTNESS_STEPS

    elif position_change < 0:
        print(current_position)
        for _ in range(-position_change):
            if (pixelBrightness > 0):
                pixelBrightness = pixelBrightness - 1
                cc.send(ConsumerControlCode.VOLUME_DECREMENT)
        print(pixelBrightness)
        NEO_PIXELS.brightness = float(pixelBrightness) / NEOPIXEL_BRIGHTNESS_STEPS
    bottomEncoder_last_position = current_position

    for key, value in led_status.items():
        current_status = kbd.led_on(value)
        if key in led_status_prior:
            if current_status != led_status_prior[key]:
                led_status_prior[key] = current_status
                print("%s: %s" % (key, current_status))
        else:
            led_status_prior[key] = current_status
            print("%s: %s" % (key, current_status))