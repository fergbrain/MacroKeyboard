# Based on https://github.com/TeachMePCB/MacroKeypad/blob/main/Source/code.py

import time

import adafruit_led_animation.animation.blink
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
from adafruit_led_animation.animation.chase import Chase
from adafruit_led_animation.animation.blink import Blink
from adafruit_led_animation.animation.comet import Comet
from adafruit_led_animation.animation.pulse import Pulse
from adafruit_led_animation.animation.rainbow import Rainbow
from adafruit_led_animation.animation.rainbowchase import RainbowChase
from adafruit_led_animation.animation.rainbowcomet import RainbowComet
from adafruit_led_animation.animation.rainbowsparkle import RainbowSparkle
from adafruit_led_animation.animation.sparklepulse import SparklePulse
from adafruit_led_animation.sequence import AnimationSequence
from adafruit_led_animation import color
from adafruit_debouncer import Debouncer
from adafruit_bus_device.spi_device import SPIDevice
from lib.fergcorp_pca9745b import PCA9745B
import adafruit_veml7700
from lib.fergcorp_pdispectra import PDISpectra
import random
import terminalio
from adafruit_display_text import label
from adafruit_button import Button

SWITCHES = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
PIN_SETUP = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

BLACK = 0x000000
WHITE = 0xFFFFFF
RED = 0xFF0000

# Change text colors, choose from the following values:
# BLACK, RED, WHITE

ENABLE_EPAPER = False


class Macrokeypad():
    # State list
    STATE_INIT = 0
    STATE_KEYPAD = 1
    STATE_ADMIN = 2
    STATE_TEACHMEPCB = 4
    STATE_QR = 6
    STATE_GAME = 8

    NEOPIXEL = 1
    ROTARY_RGB = 2

    # Key type (determine what type of command is used)
    MEDIA = 1
    KEY = 2

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

    BUTTON_TO_LIGHT_ID = {
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
        10: 0,  # LED Group 0 of PCA9745B
        11: 1  # LED Group 1 of PCA9745B
    }

    def __init__(self):
        self.state = self.STATE_INIT
        self.keymap = None
        self.kbd = Keyboard(usb_hid.devices)
        self.cc = ConsumerControl(usb_hid.devices)
        self.switches = {}

        self.encoder_top = self.encoder_top_position_last = None
        self.encoder_bottom = self.encoder_bottom_position_last = None

        displayio.release_displays()

        # led.set_led_by_group(0, *RED)
        # led.set_led_by_group(1, RED[2], RED[1], RED[0])

        self.neopixels = self.init_neopixels(num_neopixels=10, brightness_step=50)

        self.load_keymap()

        self.init_rotary_encoders()
        self.spi_bus = self.init_spi()
        if ENABLE_EPAPER:
            self.display = self.init_epaper(self.spi_bus)
        else:
            # Prevents the epaper from thinking it's receiving commands when it's not under SPI control
            eink_driver_cs = digitalio.DigitalInOut(board.GP17)
            eink_driver_cs.direction = Direction.OUTPUT
            eink_driver_cs.value = True
        self.led = self.init_rotary_encoder_lights(self.spi_bus)
        self.init_tenkey()
        self.veml = self.init_veml()
        self.veml.light_gain = self.veml.ALS_GAIN_2

    def init_spi(self):
        return busio.SPI(clock=board.GP18, MOSI=board.GP19, MISO=board.GP16)

    def init_veml(self):
        i2c = busio.I2C(scl=board.GP21,
                        sda=board.GP20)

        return adafruit_veml7700.VEML7700(i2c)

    def init_epaper(self, spi_bus) -> PDISpectra:

        displayio.release_displays()

        eink_driver_cs = board.GP17
        eink_driver_d_c = board.GP12
        eink_driver_busy = board.GP11
        eink_driver_res = board.LED

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
            seconds_per_frame=30.0,
        )

        return display

    def setup_button(self, pin: board, pull_up: bool = True):
        this_pin = DigitalInOut(pin)
        this_pin.direction = Direction.INPUT
        if pull_up:
            this_pin.pull = Pull.UP
        else:
            this_pin.pull = Pull.DOWN
        return Debouncer(this_pin)

    def setup_encoder(self, pin_a: board, pin_b: board) -> (
    rotaryio.IncrementalEncoder, rotaryio.IncrementalEncoder.position):
        encoder = rotaryio.IncrementalEncoder(pin_a, pin_b, divisor=4)
        position_last = encoder.position
        return encoder, position_last

    def init_tenkey(self):
        for i in range(10):
            self.switches[i] = self.setup_button(self.PINS[i])

    def init_rotary_encoders(self):

        self.switches[10] = self.setup_button(board.GP22, pull_up=False)
        self.switches[11] = self.setup_button(board.GP26, pull_up=False)

        self.encoder_top, self.encoder_top_position_last = self.setup_encoder(board.GP14, board.GP15)
        self.encoder_bottom, self.encoder_bottom_position_last = self.setup_encoder(board.GP28, board.GP27)

    def init_neopixels(self, num_neopixels, brightness_step):

        neopixels = neopixel.NeoPixel(board.GP0, num_neopixels, auto_write=True)
        pixel_brightness = brightness_step / 2
        neopixels.brightness = float(pixel_brightness) / brightness_step

        return neopixels

    def init_rotary_encoder_lights(self, spi_bus: busio.SPI) -> PCA9745B:
        # PCA9745B RGB LED Driver Setup
        led_driver_cs = digitalio.DigitalInOut(board.GP13)
        led_driver_cs.direction = Direction.OUTPUT
        # led_driver = SPIDevice(spi_bus, led_driver_cs, baudrate=500000, phase=0, polarity=0)

        led = PCA9745B(spi_bus, led_driver_cs, debug=False)

        led.reset()
        led.clear()

        led.set_gain_all(0x8)
        led.set_led_mode_by_group(0, 0x00)
        led.set_led_mode_by_group(1, 0x00)

        return led

    def load_keymap(self, map=1):
        # key type, keycode, normal color, color when pushed
        if map == 1:
            self.keymap = {
                (1): (self.KEY, [Keycode.OPTION, Keycode.SHIFT, Keycode.MINUS], self.NEOPIXEL, color.CYAN, color.RED),
                # EM Dash
                (2): (self.KEY, [Keycode.OPTION, Keycode.MINUS], self.NEOPIXEL, color.AQUA, color.JADE),  # EN Dash
                (3): (self.KEY, [Keycode.OPTION, Keycode.TWO], self.NEOPIXEL, color.BLUE, color.YELLOW),  # ™
                (4): (self.KEY, [Keycode.COMMAND, Keycode.SHIFT, Keycode.THREE], self.NEOPIXEL, color.PINK, color.GOLD),
                # Screenshot entire screen
                (5): (
                self.KEY, [Keycode.COMMAND, Keycode.SHIFT, Keycode.FOUR], self.NEOPIXEL, color.MAGENTA, color.GREEN),
                # Screenshot selection
                (6): (self.KEY, [Keycode.F11], self.NEOPIXEL, color.OLD_LACE, color.PURPLE),  # Show Desktop
                (7): (self.KEY, [Keycode.COMMAND, Keycode.X], self.NEOPIXEL, color.RED, color.CYAN),  # CUT
                (8): (self.KEY, [Keycode.COMMAND, Keycode.C], self.NEOPIXEL, color.AMBER, color.AQUA),  # COPY
                (9): (self.KEY, [Keycode.COMMAND, Keycode.V], self.NEOPIXEL, color.YELLOW, color.BLUE),  # PASTE
                (0): (
                self.KEY, [Keycode.LEFT_CONTROL, Keycode.COMMAND, Keycode.Q], self.NEOPIXEL, color.WHITE, color.RED),
                # Lock screen
                (10): (self.MEDIA, [Keycode.CAPS_LOCK], self.ROTARY_RGB, color.RED, color.GREEN),  # Mute
                (11): (self.MEDIA, [ConsumerControlCode.MUTE], self.ROTARY_RGB, color.GREEN, color.RED),  # Mute
            }
        elif map == 2:
            self.keymap = {
                (1): (self.KEY, [Keycode.OPTION, Keycode.SHIFT, Keycode.MINUS], self.NEOPIXEL, color.CYAN, color.RED),
                # EM Dash
                (2): (self.KEY, [Keycode.OPTION, Keycode.MINUS], self.NEOPIXEL, color.AQUA, color.JADE),  # EN Dash
                (3): (self.KEY, [Keycode.OPTION, Keycode.TWO], self.NEOPIXEL, color.BLUE, color.YELLOW),  # ™
                (4): (self.KEY, [Keycode.COMMAND, Keycode.SHIFT, Keycode.THREE], self.NEOPIXEL, color.PINK, color.GOLD),
                # Screenshot entire screen
                (5): (
                self.KEY, [Keycode.COMMAND, Keycode.SHIFT, Keycode.FOUR], self.NEOPIXEL, color.MAGENTA, color.GREEN),
                # Screenshot selection
                (6): (self.KEY, [Keycode.F11], self.NEOPIXEL, color.OLD_LACE, color.PURPLE),  # Show Desktop
                (7): (self.KEY, [Keycode.COMMAND, Keycode.X], self.NEOPIXEL, color.RED, color.CYAN),  # CUT
                (8): (self.KEY, [Keycode.COMMAND, Keycode.C], self.NEOPIXEL, color.AMBER, color.AQUA),  # COPY
                (9): (self.KEY, [Keycode.COMMAND, Keycode.V], self.NEOPIXEL, color.YELLOW, color.BLUE),  # PASTE
                (0): (
                self.KEY, [Keycode.LEFT_CONTROL, Keycode.COMMAND, Keycode.Q], self.NEOPIXEL, color.WHITE, color.RED),
                # Lock screen
                (10): (self.MEDIA, [Keycode.CAPS_LOCK], self.ROTARY_RGB, color.RED, color.GREEN),  # Mute
                (11): (self.MEDIA, [ConsumerControlCode.MUTE], self.ROTARY_RGB, color.GREEN, color.RED),  # Mute
            }

    def update_light_button(self, button, state=None, is_neopixel=True):
        btn = self.keymap[button]
        if btn[2] is self.NEOPIXEL:
            if state == 0:
                self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = (
                    btn[3][0],  # Red
                    btn[3][1],  # Green
                    btn[3][2])  # Blue
            elif state == 1:
                self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = (
                    btn[4][0],  # Red
                    btn[4][1],  # Green
                    btn[4][2])  # Blue
            else:
                rnd_color = random.choice(color.RAINBOW)
                self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = rnd_color
        elif btn[2] is self.ROTARY_RGB:
            # Because I routed the PCB wrong...BGR instead of RGB
            if self.BUTTON_TO_LIGHT_ID[button] == 0:
                if state == 0:
                    self.led.set_led_by_group(0, btn[3][0], btn[3][1], btn[3][2])
                elif state == 1:
                    self.led.set_led_by_group(0, btn[4][0], btn[4][1], btn[4][2])
                else:
                    self.led.set_led_by_group(0, *random.choice(color.RAINBOW))
            elif self.BUTTON_TO_LIGHT_ID[button] == 1:  # Because I routed the PCB wrong...BGR instead of RGB
                if state == 0:
                    self.led.set_led_by_group(1, btn[3][2], btn[3][1], btn[3][0])
                elif state == 1:
                    self.led.set_led_by_group(1, btn[4][2], btn[4][1], btn[4][0])
                else:
                    self.led.set_led_by_group(1, *random.choice(color.RAINBOW))

    def update_encoder(self, encoder: rotaryio.IncrementalEncoder, last_position: rotaryio.IncrementalEncoder.position,
                       positive_action=None,
                       negative_action=None
                       ):
        current_position = encoder.position
        position_change = current_position - last_position
        if position_change > 0:
            for _ in range(position_change):
                if self.neopixels.brightness < 1.0:
                    self.neopixels.brightness = self.neopixels.brightness + 0.1  # (1 / 255)
                    if positive_action is not None:
                        self.cc.send(positive_action)
        elif position_change < 0:
            for _ in range(-position_change):
                if self.neopixels.brightness > 0.0:
                    self.neopixels.brightness = self.neopixels.brightness - 0.1  # (1 / 255)
                    if negative_action is not None:
                        self.cc.send(negative_action)
        return current_position

    def run(self):
        if self.state is self.STATE_INIT:
            self.run_init()
        elif self.state is self.STATE_KEYPAD:
            self.run_keypad()
        elif self.state is self.STATE_ADMIN:
            self.run_admin()
        else:
            raise ValueError("Valid state not set.")

    def run_init(self):
        pass

    def run_keypad(self):
        if ENABLE_EPAPER:
            g = displayio.Group()
            with open("/macrokeyboard.bmp", "rb") as f:
                pic = displayio.OnDiskBitmap(f)
                # CircuitPython 6 & 7 compatible
                t = displayio.TileGrid(
                    pic, pixel_shader=getattr(pic, "pixel_shader", displayio.ColorConverter())
                )
                # CircuitPython 7 compatible only
                # t = displayio.TileGrid(pic, pixel_shader=pic.pixel_shader)
                g.append(t)

                self.display.show(g)

                self.display_refresh()

        self.led.reset()
        self.led.set_gain_all(0x58)
        self.led.set_led_mode_by_group(0, 0x00)
        self.led.set_led_mode_by_group(1, 0x00)

        # Initialized colors of buttons
        for button in range(12):
            self.update_light_button(button, state=0)

        while self.state == self.STATE_KEYPAD:
            self.neopixels.brightness = float(min(self.veml.light * 10, 65535) >> 8) / 255
            self.led.set_global_dim(min(self.veml.light * 10, 65535) >> 8)
            for button in range(12):
                self.switches[button].update()
                if self.switches[button].fell:
                    self.update_light_button(button, state=1)
                    if self.keymap[button][0] == self.KEY:
                        self.kbd.send(*self.keymap[button][1])
                    elif self.keymap[button][0] == self.MEDIA:
                        self.cc.send(*self.keymap[button][1])
                    else:
                        raise ValueError("Unexpected button type")
                elif self.switches[button].rose:
                    self.update_light_button(button, state=0)
            if self.switches[10].fell:
                print("Button 10")
                self.state = self.STATE_ADMIN
                break

            self.encoder_top_position_last = self.update_encoder(
                encoder=self.encoder_top,
                last_position=self.encoder_top_position_last)
            self.encoder_bottom_position_last = self.update_encoder(
                encoder=self.encoder_bottom,
                last_position=self.encoder_bottom_position_last,
                positive_action=ConsumerControlCode.VOLUME_INCREMENT,
                negative_action=ConsumerControlCode.VOLUME_DECREMENT
            )

    def run_game_tictactoe(self):

        g = displayio.Group()
        with open("/tictactoe.bmp", "rb") as f:
            pic = displayio.OnDiskBitmap(f)
            # CircuitPython 6 & 7 compatible
            t = displayio.TileGrid(
                pic, pixel_shader=getattr(pic, "pixel_shader", displayio.ColorConverter())
            )
            # CircuitPython 7 compatible only
            # t = displayio.TileGrid(pic, pixel_shader=pic.pixel_shader)
            g.append(t)

            if ENABLE_EPAPER:
                self.display.show(g)
                self.display_refresh()

        # Based on https://www.freecodecamp.org/news/how-to-make-your-tic-tac-toe-game-unbeatable-by-using-the-minimax-algorithm-9d690bad4b37/
        def minimax(newBoard, player):

            huPlayer = 'O'
            aiPlayer = 'X'

            availSpots = []
            for i in range(len(newBoard)):
                if newBoard[i] != 'X' and newBoard[i] != "O":
                    availSpots.append(i)

            #print("Availible spots: %s" % availSpots)
            if winning(newBoard, huPlayer):
                return {"score": -10}
            elif winning(newBoard, aiPlayer):
                return {"score": +10}
            elif len(availSpots) == 0:
                return {"score": 0}

            # an array to collect all the objects
            moves = []

            # loop through available spots
            for i in range(len(availSpots)):
                # create an object for each and store the index of that spot
                move = {}
                move["index"] = newBoard[availSpots[i]]

                # set the empty spot to the current player
                newBoard[availSpots[i]] = player

                # collect the score resulted from calling minimax
                #       on the opponent of the current player
                if player == aiPlayer:
                    result = minimax(newBoard, huPlayer)
                    move["score"] = result["score"]
                else:
                    result = minimax(newBoard, aiPlayer)
                    move["score"] = result["score"]

                # reset the spot to empty
                newBoard[availSpots[i]] = move["index"]

                moves.append(move)
            # if it is the computer's turn loop over the moves and choose the move with the highest score
            bestMove = None
            if player == aiPlayer:
                bestScore = -10000
                for i in range(len(moves)):
                    if moves[i]["score"] > bestScore:
                        bestScore = moves[i]["score"]
                        bestMove = i
            # else loop over the moves and choose the move with the lowest score
            else:
                bestScore = +10000
                for i in range(len(moves)):
                    if moves[i]["score"] < bestScore:
                        bestScore = moves[i]["score"]
                        bestMove = i

            return moves[bestMove]

        def winning(board, player):
            if ((board[0] == player and board[1] == player and board[2] == player) or
                    (board[3] == player and board[4] == player and board[5] == player) or
                    (board[6] == player and board[7] == player and board[8] == player) or
                    (board[0] == player and board[3] == player and board[6] == player) or
                    (board[1] == player and board[4] == player and board[7] == player) or
                    (board[2] == player and board[5] == player and board[8] == player) or
                    (board[0] == player and board[4] == player and board[8] == player) or
                    (board[2] == player and board[4] == player and board[6] == player)
            ):
                return True
            else:
                return False

        # Based on https://www.askpython.com/python/examples/tic-tac-toe-using-python
        def win_combo(board, player):

            # All possible winning combinations
            soln = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

            # Loop to check if any winning combination is satisfied
            for combo in soln:
                if all(board[spot] == player for spot in combo):
                    # Return True if any winning combination satisfies
                    return True, combo
            # Return False if no combination is satisfied
            return False

        def check_draw(player_pos):
            if len(player_pos['1']) + len(player_pos['2']) == 9:
                return True
            return False

        # Function for a single game of Tic Tac Toe
        def single_game(cur_player):

            # Represents the Tic Tac Toe
            # values = [" ", " ", " ", 2, 2, " ", 2, " ", 1, 1]  #[' ' for x in range(10)]
            board = [0, 1, 2, 3, 4, 5, 6, 7, 8]  # [x for x in range(10)]

            print(board)

            # Stores the positions occupied by X and O
            player_pos = {'1': [], '2': []}

            for button in range(10):
                self.neopixels[button] = color.BLACK

            self.neopixels.brightness = 0.5

            self.led.reset()
            self.led.set_gain_all(0x58)
            self.led.set_led_mode_by_group(0, 0x00)
            self.led.set_led_mode_by_group(1, 0x00)
            self.led.set_global_dim(50)

            if random.choice([True, False, False]):  # computer will go first 1/3 of the time
                # Computer move
                self.led.set_led_by_group(0, color.BLUE[0], color.BLUE[1], color.BLUE[2])
                self.led.set_led_by_group(1, color.GREEN[2], color.GREEN[1], color.GREEN[0])

                computer_pick = random.randint(0, 8)
                self.neopixels[self.BUTTON_TO_LIGHT_ID[computer_pick+1]] = color.BLUE
                board[computer_pick] = 'X'
                print(board)

            else:
                # self.led.set_led_by_group(0, *color.GREEN)
                self.led.set_led_by_group(0, color.GREEN[0], color.GREEN[1], color.GREEN[2])
                self.led.set_led_by_group(1, color.BLUE[2], color.BLUE[1], color.BLUE[0])

            while self.state == self.STATE_GAME:
                for i in range(len(board)):
                    if board[i] == "X":
                        self.neopixels[self.BUTTON_TO_LIGHT_ID[i + 1]] = color.BLUE
                    elif board[i] == "O":
                        self.neopixels[self.BUTTON_TO_LIGHT_ID[i + 1]] = color.GREEN
                    else:
                        self.neopixels[self.BUTTON_TO_LIGHT_ID[i + 1]] = color.BLACK

                self.switches[0].update()
                if self.switches[0].fell:
                    break
                self.switches[10].update()
                if self.switches[10].fell:
                    self.state = self.STATE_ADMIN
                    break
                for button in range(1, 10):
                    self.switches[button].update()
                    if self.switches[button].fell:
                        if board[button-1] == "X" or board[button-1] == "O":
                            self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = color.RED
                            time.sleep(0.1)
                            self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = color.BLACK
                            time.sleep(0.1)
                            self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = color.RED
                            time.sleep(0.1)
                            self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = color.BLACK
                            time.sleep(0.1)
                            if board[button-1] == 'O':
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = color.GREEN
                            else:
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = color.BLUE
                        else:
                            board[button-1] = "O"
                            self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = color.GREEN
                            if winning(board, "O"):
                                status, ans = win_combo(board, "O")
                                time.sleep(0.25)
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[0]+1]] = color.BLACK
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[1]+1]] = color.BLACK
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[2]+1]] = color.BLACK
                                time.sleep(0.5)
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[0]+1]] = color.GREEN
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[1]+1]] = color.GREEN
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[2]+1]] = color.GREEN
                                time.sleep(0.5)
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[0]+1]] = color.BLACK
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[1]+1]] = color.BLACK
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[2]+1]] = color.BLACK
                                time.sleep(0.5)
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[0]+1]] = color.GREEN
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[1]+1]] = color.GREEN
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[2]+1]] = color.GREEN
                                time.sleep(0.5)
                                for x in range(int(self.neopixels.brightness * 100), 0, -1):
                                    self.neopixels.brightness = self.neopixels.brightness - 0.01
                                    time.sleep(0.01)
                                print("User wins")
                                return True

                            availSpots = []
                            for i in range(len(board)):
                                if board[i] != 'X' and board[i] != "O":
                                    availSpots.append(i)

                            if len(availSpots) == 0:
                                # animate
                                time.sleep(0.25)
                                for x in range(int(self.neopixels.brightness * 100), 0, -1):
                                    self.neopixels.brightness = self.neopixels.brightness - 0.01
                                    time.sleep(0.01)
                                print("Draw Game")
                                return True

                            # Computer move
                            if len(availSpots) == 8:
                                if board[0] == "O":
                                    computer_pick = {"index": 5}
                                elif board[1] == "O":
                                    computer_pick = {"index": 0}
                                elif board[2] == "O":
                                    computer_pick = {"index": 4}
                                elif board[3] == "O":
                                    computer_pick = {"index": 0}
                                elif board[4] == "O":
                                    computer_pick = {"index": 0}
                                elif board[5] == "O":
                                    computer_pick = {"index": 2}
                                elif board[6] == "O":
                                    computer_pick = {"index": 4}
                                elif board[7] == "O":
                                    computer_pick = {"index": 1}
                                elif board[8] == "O":
                                    computer_pick = {"index": 4}
                                else:
                                    raise ValueError["Count is off"]
                            else:
                                computer_pick = minimax(board, "X")
                            print(computer_pick)
                            board[computer_pick["index"]] = "X"
                            print(board)

                            for i in range(len(board)):
                                if board[i] == "X":
                                    self.neopixels[self.BUTTON_TO_LIGHT_ID[i + 1]] = color.BLUE
                                elif board[i] == "O":
                                    self.neopixels[self.BUTTON_TO_LIGHT_ID[i + 1]] = color.GREEN
                                else:
                                    self.neopixels[self.BUTTON_TO_LIGHT_ID[i + 1]] = color.BLACK

                            if winning(board, "X"):
                                status, ans = win_combo(board, 'X')
                                time.sleep(0.25)
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[0]+1]] = color.BLACK
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[1]+1]] = color.BLACK
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[2]+1]] = color.BLACK
                                time.sleep(0.5)
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[0]+1]] = color.BLUE
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[1]+1]] = color.BLUE
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[2]+1]] = color.BLUE
                                time.sleep(0.5)
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[0]+1]] = color.BLACK
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[1]+1]] = color.BLACK
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[2]+1]] = color.BLACK
                                time.sleep(0.5)
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[0]+1]] = color.BLUE
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[1]+1]] = color.BLUE
                                self.neopixels[self.BUTTON_TO_LIGHT_ID[ans[2]+1]] = color.BLUE
                                time.sleep(0.5)

                                for x in range(int(self.neopixels.brightness * 100), 0, -1):
                                    self.neopixels.brightness = self.neopixels.brightness - 0.01
                                    time.sleep(0.01)
                                print("Computer wins")
                                return True

                            availSpots = []
                            for i in range(len(board)):
                                if board[i] != 'X' and board[i] != "O":
                                    availSpots.append(i)

                            if len(availSpots) == 0:
                                # animate
                                time.sleep(0.25)
                                for x in range(int(self.neopixels.brightness * 100), 0, -1):
                                    self.neopixels.brightness = self.neopixels.brightness - 0.01
                                    time.sleep(0.01)
                                print("Draw Game")
                                return True

        if self.state == self.STATE_GAME:
            single_game('1')

    def run_admin(self):

        self.admin_set_display()
        self.led.reset()

        self.neopixels.auto_write = True
        self.neopixels.brightness = 0.5
        for button in range(10):
            self.neopixels[button] = color.BLACK

        self.neopixels[self.BUTTON_TO_LIGHT_ID[7]] = color.ORANGE
        self.neopixels[self.BUTTON_TO_LIGHT_ID[9]] = color.GREEN
        selection = None

        while self.state == self.STATE_ADMIN:
            for button in range(10):  # [1,2,3,4,5,6,8]
                self.switches[button].update()
                if self.switches[button].fell:
                    if button == 7:  # Cancel
                        pass
                    if button == 9:  # Accept
                        if selection == 1:
                            self.state = self.STATE_KEYPAD
                        elif selection == 2:
                            pass
                        elif selection == 3:
                            pass
                        elif selection == 4:
                            self.state = self.STATE_TEACHMEPCB
                        elif selection == 5:
                            pass
                        elif selection == 6:
                            self.state = self.STATE_QR
                        elif selection == 8:
                            self.state = self.STATE_GAME
                            break
                    elif selection is None:
                        # self.update_light_button(button)
                        self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = random.choice(color.RAINBOW)
                        selection = button
                    elif selection == button:
                        self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = color.BLACK
                        selection = None
                    else:
                        self.button_blink(button)

    def run_teachmepcb(self):

        self.led.reset()
        self.led.set_gain_all(0x58)
        self.led.set_led_mode_by_group(0, 0x00)
        self.led.set_led_mode_by_group(1, 0x00)

        blink = Blink(self.neopixels, speed=0.5, color=random.choice(color.RAINBOW))
        comet = RainbowComet(self.neopixels, speed=0.01, tail_length=3, bounce=True)
        chase = RainbowChase(self.neopixels, speed=0.1, size=3, spacing=6, )
        rainbow = Rainbow(self.neopixels, speed=0.1)
        sparkle = RainbowSparkle(self.neopixels, speed=0.1)

        animations = [blink, comet, chase, rainbow, sparkle]

        self.led.set_led_by_group(0, *random.choice(color.RAINBOW))
        self.led.set_led_by_group(1, *random.choice(color.RAINBOW))

        self.led.set_gradation_by_group(group=0, ramp_rate_step_value=1, final_iref_gain=0x0F,
                                        cycle_time_base=True, cycle_multiplier=4,
                                        hold_off=True, hold_off_time=2)
        self.led.set_gradation_by_group(group=1, ramp_rate_step_value=1, final_iref_gain=0x0F,
                                        cycle_time_base=True, cycle_multiplier=4,
                                        hold_off=False, hold_off_time=2)

        self.led.set_gradation_control_by_group(0, start=True)
        self.led.set_gradation_control_by_group(1, start=True)

        g = displayio.Group()
        with open("/tmpcb.bmp", "rb") as f:
            pic = displayio.OnDiskBitmap(f)
            # CircuitPython 6 & 7 compatible
            t = displayio.TileGrid(
                pic, pixel_shader=getattr(pic, "pixel_shader", displayio.ColorConverter())
            )
            # CircuitPython 7 compatible only
            # t = displayio.TileGrid(pic, pixel_shader=pic.pixel_shader)
            g.append(t)

            if ENABLE_EPAPER:
                self.display.show(g)
                self.display_refresh()

        this_animation = random.choice(animations)

        while self.state == self.STATE_TEACHMEPCB:
            this_animation.animate()
            self.neopixels.brightness = float(min(self.veml.light * 10, 65535) >> 8) / 255
            self.led.set_global_dim(min(self.veml.light * 10, 65535) >> 8)

            self.switches[10].update()
            if self.switches[10].fell:
                self.state = self.STATE_ADMIN
                break

            self.switches[0].update()
            if self.switches[0].fell:
                this_animation = random.choice(animations)
                self.led.set_led_by_group(0, *random.choice(color.RAINBOW))
                self.led.set_led_by_group(1, *random.choice(color.RAINBOW))

    def run_qr(self):

        for button in range(10):
            self.neopixels[button] = color.BLACK
        self.led.set_led_by_group(0, *color.AMBER)
        self.led.set_led_by_group(1, red=color.RED[2], green=color.RED[1], blue=color.RED[0])

        self.led.set_gradation_by_group(group=0, ramp_rate_step_value=1, final_iref_gain=0x0F,
                                        cycle_time_base=True, cycle_multiplier=4,
                                        hold_off=True, hold_off_time=2)
        self.led.set_gradation_by_group(group=1, ramp_rate_step_value=10, final_iref_gain=0x0F,
                                        cycle_time_base=False, cycle_multiplier=32,
                                        hold_off=True, hold_off_time=2)

        self.led.set_gradation_control_by_group(0, start=True)
        self.led.set_gradation_control_by_group(1, start=True)

        self.generate_qr(b'https://www.youtube.com/watch?v=dQw4w9WgXcQ')
        while self.state == self.STATE_QR:
            self.switches[10].update()
            if self.switches[10].fell:
                self.state = self.STATE_ADMIN
                break

        self.led.set_gradation_control_by_group(0, start=False)
        self.led.set_gradation_control_by_group(1, start=False)

    def admin_set_display(self):
        if ENABLE_EPAPER:
            # Create a display group for our screen objects
            g = displayio.Group()

            # Set a background
            background_bitmap = displayio.Bitmap(152, 152, 1)
            # Map colors in a palette
            palette = displayio.Palette(1)
            palette[0] = WHITE

            # Create a Tilegrid with the background and put in the displayio group
            t = displayio.TileGrid(background_bitmap, pixel_shader=palette)
            g.append(t)
            g.append(self.display_create_title("Admin Menu"))

            g.append(self.display_create_9x9_text_tile("General", 0, 0))
            g.append(self.display_create_9x9_text_tile("PyCharm", 1, 0))
            g.append(self.display_create_9x9_text_tile("Fotoshp", 2, 0))
            g.append(self.display_create_9x9_text_tile("TMPCB", 0, 1))
            g.append(self.display_create_9x9_text_tile("Empty", 1, 1))
            g.append(self.display_create_9x9_text_tile("QR RR", 2, 1))
            g.append(self.display_create_9x9_text_tile("Cancel", 0, 2))
            g.append(self.display_create_9x9_text_tile("Game", 1, 2))
            g.append(self.display_create_9x9_text_tile("Accept", 2, 2))

            # Place the display group on the screen
            self.display.show(g)

            # Refresh the display to have everything show on the display
            # NOTE: Do not refresh eInk displays more often than 180 seconds!

            self.display_refresh()

    def display_refresh(self):
        print("Display_Refresh")
        if ENABLE_EPAPER:
            if self.display.time_to_refresh > 0.0:
                pulse = Pulse(self.neopixels, speed=self.display.time_to_refresh / 50, period=5, color=color.OLD_LACE)
                while self.display.time_to_refresh > 0.0:
                    pulse.speed = self.display.time_to_refresh / 50
                    pulse.animate()
                pulse.animate(show=False)
                self.neopixels.auto_write = True

                # self.neopixels.deinit()
                # self.neopixels = self.init_neopixels(num_neopixels=10, brightness_step=50)

            self.display.refresh()

    def display_create_title(self, text) -> displayio.Group:

        if len(text) > 12:
            raise ValueError("Title text too long.")

        # Draw simple text using the built-in font into a displayio group
        text_group = displayio.Group(scale=2, x=0, y=0)
        text_area = label.Label(terminalio.FONT, text=text, color=RED)
        text_area.anchor_point = (0, 0)
        text_area.anchored_position = (0, 0)
        text_group.append(text_area)  # Add this text to the text group

        return text_group

    def display_create_9x9_text_tile(self, text, x, y) -> displayio.Group:
        if len(text) > 7:
            raise ValueError("Title text too long.")

        if x < 0 or x > 2:
            raise ValueError("X position out of range.")

        if y < 0 or y > 2:
            raise ValueError("Y position out of range.")

        button = Button(x=50 * x,
                        y=110 - (40 * (2 - y)),
                        width=50,
                        height=40,
                        style=Button.ROUNDRECT,
                        fill_color=WHITE,
                        outline_color=RED,
                        label=text,
                        label_font=terminalio.FONT,
                        label_color=BLACK)

        return button

    def button_blink(self, button):
        self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = color.RED
        time.sleep(0.1)
        self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = color.BLACK
        time.sleep(0.1)
        self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = color.RED
        time.sleep(0.1)
        self.neopixels[self.BUTTON_TO_LIGHT_ID[button]] = color.BLACK
        time.sleep(0.1)

    def generate_qr(self, input):
        import adafruit_miniqr

        qr = adafruit_miniqr.QRCode()
        qr.add_data(input)
        qr.make()

        bitmap = displayio.Bitmap(152, 152, 2)

        lines = str(qr.matrix).splitlines()

        for y in range(len(lines)):
            for x in range(len(lines[y])):
                if lines[y][x] == "X":
                    for xx in range(x * 5, (x + 1) * 5):
                        for yy in range(y * 5, (y + 1) * 5):
                            bitmap[xx, yy] = 1

        # Create a two color palette
        palette = displayio.Palette(2)
        palette[0] = 0xffffff
        palette[1] = 0x000000

        # Create a TileGrid using the Bitmap and Palette
        tile_grid = displayio.TileGrid(bitmap, pixel_shader=palette)

        # Create a Group
        group = displayio.Group()

        # Add the TileGrid to the Group
        group.append(tile_grid)

        if ENABLE_EPAPER:
            # Add the Group to the Display
            self.display.show(group)
            self.display_refresh()

    def switch_state(self):
        if self.state == self.STATE_INIT:
            self.run_init()
        elif self.state == self.STATE_KEYPAD:
            self.run_keypad()
        elif self.state == self.STATE_ADMIN:
            self.run_admin()
        elif self.state == self.STATE_GAME:
            self.run_game_tictactoe()
        elif self.state == self.STATE_QR:
            self.run_qr()
        elif self.state == self.STATE_TEACHMEPCB:
            self.run_teachmepcb()
        else:
            for button in range(10):
                self.neopixels[button] = color.RED


if __name__ == "__main__":
    macro = Macrokeypad()
    # macro.run_keypad()
    macro.state = macro.STATE_GAME
    while True:
        macro.switch_state()
