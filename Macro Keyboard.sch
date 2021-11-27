EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 29
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1250 3900 950  900 
U 61A047C3
F0 "Rotary Encoder" 50
F1 "RotaryEncoder.sch" 50
F2 "REnc_A" O R 2200 3950 50 
F3 "REnc_B" O R 2200 4050 50 
F4 "REnc_LED_R" O R 2200 4500 50 
F5 "REnc_LED_G" O R 2200 4600 50 
F6 "REnc_LED_B" O R 2200 4700 50 
F7 "REnc_SW" O R 2200 4150 50 
$EndSheet
$Sheet
S 5750 3700 800  250 
U 61A0B3CD
F0 "Light Sensor" 50
F1 "LightSensor.sch" 50
F2 "SCL" I L 5750 3750 50 
F3 "SDA" I L 5750 3850 50 
$EndSheet
$Sheet
S 5750 4250 900  200 
U 61A0B4C7
F0 "Level Converter" 50
F1 "LevelConverter.sch" 50
F2 "D_OUT_5V" O R 6650 4350 50 
F3 "D_IN_3V3" I L 5750 4350 50 
$EndSheet
$Sheet
S 2450 2150 550  1100
U 61A0B595
F0 "10 Group Switch" 50
F1 "10GroupSwitch.sch" 50
F2 "SW01" O R 3000 2250 50 
F3 "SW02" O R 3000 2350 50 
F4 "SW03" O R 3000 2450 50 
F5 "SW04" O R 3000 2550 50 
F6 "SW05" O R 3000 2650 50 
F7 "SW06" O R 3000 2750 50 
F8 "SW07" O R 3000 2850 50 
F9 "SW08" O R 3000 2950 50 
F10 "SW09" O R 3000 3050 50 
F11 "SW10" O R 3000 3150 50 
$EndSheet
$Sheet
S 7100 4250 800  200 
U 61A0B661
F0 "LED 10" 50
F1 "LED10.sch" 50
F2 "NEOPIXEL_DIN_5V" I L 7100 4350 50 
$EndSheet
Wire Wire Line
	2500 4700 2200 4700
Wire Wire Line
	2200 4600 2500 4600
Wire Wire Line
	2200 4500 2500 4500
$Sheet
S 2500 4250 750  550 
U 61A0B364
F0 "RGB Driver" 50
F1 "RGBDrvier.sch" 50
F2 "DRIVER_LED_R" I L 2500 4500 50 
F3 "DRIVER_LED_G" I L 2500 4600 50 
F4 "DRIVER_LED_B" I L 2500 4700 50 
F5 "DRIVER_LED_RCK" I R 3250 4350 50 
$EndSheet
$Sheet
S 3550 2150 1700 2300
U 61A0B536
F0 "Pico" 50
F1 "Pico.sch" 50
F2 "GPIO_00" B R 5250 4350 50 
F3 "GPIO_01" B L 3550 2250 50 
F4 "GPIO_02" B L 3550 2350 50 
F5 "GPIO_03" B L 3550 2450 50 
F6 "GPIO_04" B L 3550 2550 50 
F7 "GPIO_05" B L 3550 2650 50 
F8 "GPIO_06" B L 3550 2750 50 
F9 "GPIO_07" B L 3550 2850 50 
F10 "GPIO_08" B L 3550 2950 50 
F11 "GPIO_09" B L 3550 3050 50 
F12 "GPIO_10" B L 3550 3150 50 
F13 "GPIO_11" B R 5250 2850 50 
F14 "GPIO_12" B R 5250 2950 50 
F15 "GPIO_13" B L 3550 4350 50 
F16 "GPIO_14" B L 3550 3800 50 
F17 "GPIO_15" B L 3550 3900 50 
F18 "GPIO_16" B R 5250 3050 50 
F19 "GPIO_17" B R 5250 3150 50 
F20 "GPIO_18" B R 5250 3250 50 
F21 "GPIO_19" B R 5250 3350 50 
F22 "GPIO_20" B R 5250 3850 50 
F23 "GPIO_21" B R 5250 3750 50 
F24 "GPIO_22" B L 3550 4000 50 
F25 "GPIO_26_ADC0" B R 5250 2250 50 
F26 "GPIO_27_ADC1" B R 5250 2350 50 
F27 "GPIO_28_ADC2" B R 5250 2450 50 
$EndSheet
Wire Wire Line
	3550 2250 3000 2250
Wire Wire Line
	3000 2350 3550 2350
Wire Wire Line
	3550 2450 3000 2450
Wire Wire Line
	3000 2550 3550 2550
Wire Wire Line
	3550 2650 3000 2650
Wire Wire Line
	3000 2750 3550 2750
Wire Wire Line
	3550 2850 3000 2850
Wire Wire Line
	3000 2950 3550 2950
Wire Wire Line
	3550 3050 3000 3050
Wire Wire Line
	3000 3150 3550 3150
$Sheet
S 6650 2700 800  500 
U 61A7FF0F
F0 "eInk Display" 50
F1 "eInkDisplay.sch" 50
F2 "DS_CS_3V3" I L 6650 3150 50 
F3 "DS_D_C_3V3" I L 6650 2850 50 
F4 "DS_BUSY_3V3" I L 6650 2950 50 
$EndSheet
Wire Wire Line
	6650 4350 7100 4350
Wire Wire Line
	5250 4350 5750 4350
Text GLabel 5750 3350 2    50   Input ~ 0
SPI_MOSI_3V
Text GLabel 5750 3250 2    50   Input ~ 0
SPI_SCLK_3V
Wire Wire Line
	5250 3050 5750 3050
Wire Wire Line
	5250 3250 5750 3250
Wire Wire Line
	5250 3350 5750 3350
Text GLabel 5750 3050 2    50   Input ~ 0
SPI_MISO_3V
Wire Wire Line
	5250 3150 6650 3150
Wire Wire Line
	3250 4350 3550 4350
Wire Wire Line
	2200 3950 2350 3950
Wire Wire Line
	2350 3950 2350 3800
Wire Wire Line
	2350 3800 3550 3800
Wire Wire Line
	2200 4050 2400 4050
Wire Wire Line
	2400 4050 2400 3900
Wire Wire Line
	2400 3900 3550 3900
Wire Wire Line
	2200 4150 2450 4150
Wire Wire Line
	2450 4150 2450 4000
Wire Wire Line
	2450 4000 3550 4000
Wire Wire Line
	5250 3750 5750 3750
Wire Wire Line
	5250 3850 5750 3850
Wire Wire Line
	5250 2950 6650 2950
Wire Wire Line
	5250 2850 6650 2850
$EndSCHEMATC
