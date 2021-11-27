EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 27 29
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L TMPCB_R2:NLSF595 U301
U 1 1 61A3928E
P 5300 1200
F 0 "U301" H 5325 1215 50  0000 C CNN
F 1 "NLSF595" H 5325 1124 50  0000 C CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 5300 1200 50  0001 C CNN
F 3 "" H 5300 1200 50  0001 C CNN
F 4 "Need from TeachMePCB" H 5300 1200 50  0001 C CNN "Notes"
	1    5300 1200
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R304
U 1 1 61A3FADF
P 6800 1300
F 0 "R304" V 6850 1400 50  0000 C CNN
F 1 "1k 5%" V 6750 1450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 6800 1300 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 6800 1300 50  0001 C CNN
F 4 "RMCF0805JT1K00CT-ND" H 6800 1300 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 6800 1300 50  0001 C CNN "MFG"
F 6 "RMCF0805JT1K00" H 6800 1300 50  0001 C CNN "MFG #"
	1    6800 1300
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R305
U 1 1 61A41C08
P 6800 1750
F 0 "R305" V 6850 1850 50  0000 C CNN
F 1 "1k 5%" V 6750 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 6800 1750 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 6800 1750 50  0001 C CNN
F 4 "RMCF0805JT1K00CT-ND" H 6800 1750 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 6800 1750 50  0001 C CNN "MFG"
F 6 "RMCF0805JT1K00" H 6800 1750 50  0001 C CNN "MFG #"
	1    6800 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R303
U 1 1 61A429FE
P 6500 3000
F 0 "R303" V 6550 3100 50  0000 C CNN
F 1 "1k 5%" V 6450 3150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 6500 3000 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 6500 3000 50  0001 C CNN
F 4 "RMCF0805JT1K00CT-ND" H 6500 3000 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 6500 3000 50  0001 C CNN "MFG"
F 6 "RMCF0805JT1K00" H 6500 3000 50  0001 C CNN "MFG #"
	1    6500 3000
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R301
U 1 1 61A3D9CE
P 6450 3600
F 0 "R301" V 6550 3600 50  0000 C CNN
F 1 "4.7k 5%" V 6350 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 6450 3600 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 6450 3600 50  0001 C CNN
F 4 "RMCF0805JT4K70CT-ND" H 6450 3600 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 6450 3600 50  0001 C CNN "MFG"
F 6 "RMCF0805JT4K70" H 6450 3600 50  0001 C CNN "MFG #"
	1    6450 3600
	-1   0    0    1   
$EndComp
Text Label 5700 1500 0    50   ~ 0
VCC
Wire Wire Line
	5600 1500 5700 1500
Text Label 5700 1600 0    50   ~ 0
GND
Wire Wire Line
	5700 1600 5600 1600
Text Label 6450 1200 2    50   ~ 0
VCC
$Comp
L power:GND #PWR0303
U 1 1 61A3D210
P 6600 1850
F 0 "#PWR0303" H 6600 1600 50  0001 C CNN
F 1 "GND" H 6605 1677 50  0000 C CNN
F 2 "" H 6600 1850 50  0001 C CNN
F 3 "" H 6600 1850 50  0001 C CNN
	1    6600 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C301
U 1 1 61A3C95F
P 6600 1550
F 0 "C301" H 6508 1504 50  0000 R CNN
F 1 "1 uF 10% 10V" H 6508 1595 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6600 1550 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KPFNNNE.jsp" H 6600 1550 50  0001 C CNN
F 4 "1276-1275-1-ND" H 6600 1550 50  0001 C CNN "Digikey PN"
F 5 "Samsung Electro-Mechanics" H 6600 1550 50  0001 C CNN "MFG"
F 6 "CL21B105KPFNNNE" H 6600 1550 50  0001 C CNN "MFG #"
	1    6600 1550
	-1   0    0    1   
$EndComp
$Comp
L power:+3V3 #PWR0302
U 1 1 61A3A724
P 6600 1150
F 0 "#PWR0302" H 6600 1000 50  0001 C CNN
F 1 "+3V3" H 6615 1323 50  0000 C CNN
F 2 "" H 6600 1150 50  0001 C CNN
F 3 "" H 6600 1150 50  0001 C CNN
	1    6600 1150
	1    0    0    -1  
$EndComp
Text Label 6450 1800 2    50   ~ 0
GND
Text Label 5700 1900 0    50   ~ 0
RCK
Wire Wire Line
	5600 1900 5700 1900
Text Label 5700 2000 0    50   ~ 0
NOT_SCLR
Wire Wire Line
	5600 2000 5700 2000
Text Label 5700 2100 0    50   ~ 0
SCK
Wire Wire Line
	5600 2100 5700 2100
Text Label 5700 2200 0    50   ~ 0
SI
Wire Wire Line
	5600 2200 5700 2200
Text Label 5700 1800 0    50   ~ 0
NOT_OE
Wire Wire Line
	5600 1800 5700 1800
Text Label 6300 3400 2    50   ~ 0
RCK
Text Label 7200 1300 0    50   ~ 0
NOT_SCLR
Text Label 6300 3000 2    50   ~ 0
SCK
Text Label 6300 2700 2    50   ~ 0
SI
Text Label 7200 1750 0    50   ~ 0
NOT_OE
Wire Wire Line
	6600 1150 6600 1200
Wire Wire Line
	6450 1200 6600 1200
Connection ~ 6600 1200
Wire Wire Line
	6450 1800 6600 1800
Wire Wire Line
	6600 1800 6600 1850
Wire Wire Line
	6600 1650 6600 1750
Connection ~ 6600 1800
Wire Wire Line
	6600 1200 6600 1300
Wire Wire Line
	6600 1300 6700 1300
Connection ~ 6600 1300
Wire Wire Line
	6600 1300 6600 1450
Wire Wire Line
	6900 1300 7200 1300
Wire Wire Line
	7200 1750 6900 1750
Wire Wire Line
	6700 1750 6600 1750
Connection ~ 6600 1750
Wire Wire Line
	6600 1750 6600 1800
NoConn ~ 4950 2350
NoConn ~ 4950 2200
NoConn ~ 4950 2100
NoConn ~ 4950 2000
NoConn ~ 4950 1900
NoConn ~ 4950 1800
Text HLabel 4750 1500 0    50   Input ~ 0
DRIVER_LED_R
Text HLabel 4750 1600 0    50   Input ~ 0
DRIVER_LED_G
Text HLabel 4750 1700 0    50   Input ~ 0
DRIVER_LED_B
Wire Wire Line
	4750 1500 4950 1500
Wire Wire Line
	4750 1600 4950 1600
Wire Wire Line
	4750 1700 4950 1700
$Comp
L Device:R_Small_US R302
U 1 1 61A5BA43
P 6500 2700
F 0 "R302" V 6550 2800 50  0000 C CNN
F 1 "1k 5%" V 6450 2850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 6500 2700 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 6500 2700 50  0001 C CNN
F 4 "RMCF0805JT1K00CT-ND" H 6500 2700 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 6500 2700 50  0001 C CNN "MFG"
F 6 "RMCF0805JT1K00" H 6500 2700 50  0001 C CNN "MFG #"
	1    6500 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 2700 6400 2700
Wire Wire Line
	6400 3000 6300 3000
Text GLabel 7050 3000 2    50   Input ~ 0
SPI_SCLK_3V
Wire Wire Line
	7050 3000 6600 3000
Text GLabel 7050 2700 2    50   Input ~ 0
SPI_MOSI_3V
Wire Wire Line
	7050 2700 6600 2700
$Comp
L power:GND #PWR0301
U 1 1 61A5E7D1
P 6450 3800
F 0 "#PWR0301" H 6450 3550 50  0001 C CNN
F 1 "GND" H 6455 3627 50  0000 C CNN
F 2 "" H 6450 3800 50  0001 C CNN
F 3 "" H 6450 3800 50  0001 C CNN
	1    6450 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3800 6450 3700
Wire Wire Line
	6450 3500 6450 3400
Wire Wire Line
	6450 3400 6300 3400
Text HLabel 7050 3400 2    50   Input ~ 0
DRIVER_LED_RCK
Wire Wire Line
	7050 3400 6450 3400
Connection ~ 6450 3400
$EndSCHEMATC
