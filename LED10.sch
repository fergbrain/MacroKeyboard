EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 16 29
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
S 4100 3100 650  200 
U 61A171D3
F0 "Neo LED 01" 50
F1 "NeoLED.sch" 50
F2 "D_IN" I L 4100 3200 50 
F3 "D_OUT" O R 4750 3200 50 
$EndSheet
$Sheet
S 5150 3100 650  200 
U 61A1CCBC
F0 "Neo LED 02" 50
F1 "NeoLED.sch" 50
F2 "D_IN" I L 5150 3200 50 
F3 "D_OUT" O R 5800 3200 50 
$EndSheet
$Sheet
S 6200 3100 650  200 
U 61A1CE5F
F0 "Neo LED 03" 50
F1 "NeoLED.sch" 50
F2 "D_IN" I L 6200 3200 50 
F3 "D_OUT" O R 6850 3200 50 
$EndSheet
$Sheet
S 7200 3100 650  200 
U 61A1D175
F0 "Neo LED 04" 50
F1 "NeoLED.sch" 50
F2 "D_IN" I L 7200 3200 50 
F3 "D_OUT" O R 7850 3200 50 
$EndSheet
$Sheet
S 8250 3100 650  200 
U 61A1D179
F0 "Neo LED 05" 50
F1 "NeoLED.sch" 50
F2 "D_IN" I L 8250 3200 50 
F3 "D_OUT" O R 8900 3200 50 
$EndSheet
$Sheet
S 4100 3750 650  200 
U 61A1D17D
F0 "Neo LED 06" 50
F1 "NeoLED.sch" 50
F2 "D_IN" I L 4100 3850 50 
F3 "D_OUT" O R 4750 3850 50 
$EndSheet
$Sheet
S 5150 3750 650  200 
U 61A1D839
F0 "Neo LED 07" 50
F1 "NeoLED.sch" 50
F2 "D_IN" I L 5150 3850 50 
F3 "D_OUT" O R 5800 3850 50 
$EndSheet
$Sheet
S 6200 3750 650  200 
U 61A1D83D
F0 "Neo LED 08" 50
F1 "NeoLED.sch" 50
F2 "D_IN" I L 6200 3850 50 
F3 "D_OUT" O R 6850 3850 50 
$EndSheet
$Sheet
S 7250 3750 650  200 
U 61A1D841
F0 "Neo LED 09" 50
F1 "NeoLED.sch" 50
F2 "D_IN" I L 7250 3850 50 
F3 "D_OUT" O R 7900 3850 50 
$EndSheet
$Sheet
S 8250 3750 650  200 
U 61A1D845
F0 "Neo LED 10" 50
F1 "NeoLED.sch" 50
F2 "D_IN" I L 8250 3850 50 
F3 "D_OUT" O R 8900 3850 50 
$EndSheet
Wire Wire Line
	4750 3200 5150 3200
Wire Wire Line
	5800 3200 6200 3200
Wire Wire Line
	6850 3200 7200 3200
Wire Wire Line
	7850 3200 8250 3200
Wire Wire Line
	8900 3200 9050 3200
Wire Wire Line
	9050 3200 9050 3550
Wire Wire Line
	9050 3550 3950 3550
Wire Wire Line
	3950 3550 3950 3850
Wire Wire Line
	3950 3850 4100 3850
Wire Wire Line
	4750 3850 5150 3850
Wire Wire Line
	5800 3850 6200 3850
Wire Wire Line
	6850 3850 7250 3850
Wire Wire Line
	7900 3850 8250 3850
$Comp
L Device:R_Small_US R1801
U 1 1 61A1E529
P 3650 3200
F 0 "R1801" V 3445 3200 50  0000 C CNN
F 1 "150 5%" V 3536 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 3650 3200 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 3650 3200 50  0001 C CNN
F 4 "RMCF0805JT150RCT-ND" H 3650 3200 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 3650 3200 50  0001 C CNN "MFG"
F 6 "RMCF0805JT150R" H 3650 3200 50  0001 C CNN "MFG #"
	1    3650 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 3200 4100 3200
Text HLabel 3300 3200 0    50   Input ~ 0
NEOPIXEL_DIN_5V
Wire Wire Line
	3300 3200 3550 3200
$Comp
L Device:R_Small_US R1802
U 1 1 61A20FA6
P 9300 3850
F 0 "R1802" V 9095 3850 50  0000 C CNN
F 1 "2.7k 5%" V 9186 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 9300 3850 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 9300 3850 50  0001 C CNN
F 4 "RMCF0805JT2K70CT-ND" H 9300 3850 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 9300 3850 50  0001 C CNN "MFG"
F 6 "RMCF0805JT2K70" H 9300 3850 50  0001 C CNN "MFG #"
	1    9300 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	8900 3850 9200 3850
$Comp
L power:GND #PWR01801
U 1 1 61A21A87
P 9700 4000
F 0 "#PWR01801" H 9700 3750 50  0001 C CNN
F 1 "GND" H 9705 3827 50  0000 C CNN
F 2 "" H 9700 4000 50  0001 C CNN
F 3 "" H 9700 4000 50  0001 C CNN
	1    9700 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 4000 9700 3850
Wire Wire Line
	9700 3850 9400 3850
$EndSCHEMATC
