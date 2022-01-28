EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 27 30
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
NoConn ~ 7800 2650
NoConn ~ 7800 2950
$Comp
L Macro_Keyboard:Conn_01x24 J2701
U 1 1 61A8C93F
P 8000 3750
F 0 "J2701" H 8080 3742 50  0000 L CNN
F 1 "FPC 1x24" H 8080 3651 50  0000 L CNN
F 2 "Macro Keyboard:Amphenol_F31L-1A7H1-11024" H 8000 3750 50  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/5052782433_sd.pdf" H 8000 3750 50  0001 C CNN
F 4 "WM20872CT-ND" H 8000 3750 50  0001 C CNN "Digikey PN"
F 5 "Molex" H 8000 3750 50  0001 C CNN "MFG"
F 6 "5052782433" H 8000 3750 50  0001 C CNN "MFG #"
	1    8000 3750
	1    0    0    -1  
$EndComp
NoConn ~ 7800 3150
NoConn ~ 7800 3250
NoConn ~ 7800 4450
$Comp
L Device:Q_PJFET_GDS Q2701
U 1 1 61A8EEB3
P 6000 2750
F 0 "Q2701" H 5750 2600 50  0000 L CNN
F 1 "Q_PJFET_GDS" H 5500 2900 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6200 2850 50  0001 C CNN
F 3 "https://www.taiwansemi.com/assets/uploads/datasheet/TSM850N06CX_C1811.pdf" H 6000 2750 50  0001 C CNN
F 4 "TSM850N06CXRFGCT-ND" H 6000 2750 50  0001 C CNN "Digikey PN"
F 5 "Taiwan Semiconductor Corporation" H 6000 2750 50  0001 C CNN "MFG"
F 6 "TSM850N06CX RFG" H 6000 2750 50  0001 C CNN "MFG #"
	1    6000 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	7800 2750 6200 2750
$Comp
L Device:L_Small L2701
U 1 1 61A90080
P 4650 2550
F 0 "L2701" V 4835 2550 50  0000 C CNN
F 1 "10 uH 20% 0.8A" V 4744 2550 50  0000 C CNN
F 2 "Inductor_SMD:L_Taiyo-Yuden_NR-40xx_HandSoldering" H 4650 2550 50  0001 C CNN
F 3 "https://www.yuden.co.jp/productdata/catalog/wound04_e.pdf" H 4650 2550 50  0001 C CNN
F 4 "587-1659-1-ND" H 4650 2550 50  0001 C CNN "Digikey PN"
F 5 "Taiyo Yuden" H 4650 2550 50  0001 C CNN "MFG"
F 6 "NR4012T100M" H 4650 2550 50  0001 C CNN "MFG #"
	1    4650 2550
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR02701
U 1 1 61A90F00
P 4400 2350
F 0 "#PWR02701" H 4400 2200 50  0001 C CNN
F 1 "+3V3" H 4415 2523 50  0000 C CNN
F 2 "" H 4400 2350 50  0001 C CNN
F 3 "" H 4400 2350 50  0001 C CNN
	1    4400 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2350 4400 2550
Wire Wire Line
	4850 2550 5150 2550
$Comp
L Device:R_Small_US R2701
U 1 1 61A9164C
P 5900 3300
F 0 "R2701" H 5968 3346 50  0000 L CNN
F 1 "0.47 5%" H 5968 3255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 5900 3300 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 5900 3300 50  0001 C CNN
F 4 "RMCF0805JT470RCT-ND" H 5900 3300 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 5900 3300 50  0001 C CNN "MFG"
F 6 "RMCF0805JT470R" H 5900 3300 50  0001 C CNN "MFG #"
	1    5900 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2701
U 1 1 61A9221A
P 4350 3300
F 0 "C2701" V 4250 3200 50  0000 L CNN
F 1 "1 uF 10% 10V" V 4450 3050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4350 3300 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KPFNNNE.jsp" H 4350 3300 50  0001 C CNN
F 4 "1276-1275-1-ND" H 4350 3300 50  0001 C CNN "Digikey PN"
F 5 "Samsung Electro-Mechanics" H 4350 3300 50  0001 C CNN "MFG"
F 6 "CL21B105KPFNNNE" H 4350 3300 50  0001 C CNN "MFG #"
	1    4350 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky_Small D2702
U 1 1 61A93B5D
P 4850 3300
F 0 "D2702" H 4900 3400 50  0000 R CNN
F 1 "MBR0530" H 4850 3200 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" V 4850 3300 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/MBR0520-MBR0580(SOD123).pdf" V 4850 3300 50  0001 C CNN
F 4 "MBR0530TPMSCT-ND" H 4850 3300 50  0001 C CNN "Digikey PN"
F 5 "Micro Commercial Co" H 4850 3300 50  0001 C CNN "MFG"
F 6 "MBR0530-TP" H 4850 3300 50  0001 C CNN "MFG #"
	1    4850 3300
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_Small D2703
U 1 1 61A9411A
P 5150 2850
F 0 "D2703" H 5450 2900 50  0000 R CNN
F 1 "MBR0530" H 5450 2750 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" V 5150 2850 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/MBR0520-MBR0580(SOD123).pdf" V 5150 2850 50  0001 C CNN
F 4 "MBR0530TPMSCT-ND" H 5150 2850 50  0001 C CNN "Digikey PN"
F 5 "Micro Commercial Co" H 5150 2850 50  0001 C CNN "MFG"
F 6 "MBR0530-TP" H 5150 2850 50  0001 C CNN "MFG #"
	1    5150 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_Small D2701
U 1 1 61A94531
P 4600 3000
F 0 "D2701" H 4650 2900 50  0000 C CNN
F 1 "MBR0530" H 4550 3100 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" V 4600 3000 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/MBR0520-MBR0580(SOD123).pdf" V 4600 3000 50  0001 C CNN
F 4 "MBR0530TPMSCT-ND" H 4600 3000 50  0001 C CNN "Digikey PN"
F 5 "Micro Commercial Co" H 4600 3000 50  0001 C CNN "MFG"
F 6 "MBR0530-TP" H 4600 3000 50  0001 C CNN "MFG #"
	1    4600 3000
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C2702
U 1 1 61A94C59
P 4850 2850
F 0 "C2702" V 4750 2750 50  0000 L CNN
F 1 "4.7 uF 10% 10V" V 4950 2500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4850 2850 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21A475KPFNNNE.jsp" H 4850 2850 50  0001 C CNN
F 4 "1276-1259-1-ND" H 4850 2850 50  0001 C CNN "Digikey PN"
F 5 "Samsung Electro-Mechanics" H 4850 2850 50  0001 C CNN "MFG"
F 6 "CL21A475KPFNNNE" H 4850 2850 50  0001 C CNN "MFG #"
	1    4850 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2950 4850 3000
Wire Wire Line
	4850 2550 4850 2750
Connection ~ 4850 2550
Wire Wire Line
	5150 2750 5150 2550
Connection ~ 5150 2550
Wire Wire Line
	5150 2550 5900 2550
Wire Wire Line
	5150 2950 5150 3050
Wire Wire Line
	4700 3000 4850 3000
Connection ~ 4850 3000
Wire Wire Line
	4850 3000 4850 3200
Wire Wire Line
	4350 3200 4350 3100
Wire Wire Line
	4350 3000 4500 3000
Wire Wire Line
	4350 3400 4350 3700
Wire Wire Line
	4350 3700 4850 3700
Wire Wire Line
	5900 3700 5900 3400
Wire Wire Line
	5150 3400 5150 3700
Connection ~ 5150 3700
Wire Wire Line
	5150 3700 5900 3700
Wire Wire Line
	4850 3400 4850 3700
Connection ~ 4850 3700
Wire Wire Line
	4850 3700 5000 3700
$Comp
L Device:C_Small C2703
U 1 1 61A91DEE
P 5150 3300
F 0 "C2703" V 5100 3000 50  0000 L CNN
F 1 "1 uF 10% 10V" V 5250 2950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5150 3300 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KPFNNNE.jsp" H 5150 3300 50  0001 C CNN
F 4 "1276-1275-1-ND" H 5150 3300 50  0001 C CNN "Digikey PN"
F 5 "Samsung Electro-Mechanics" H 5150 3300 50  0001 C CNN "MFG"
F 6 "CL21B105KPFNNNE" H 5150 3300 50  0001 C CNN "MFG #"
	1    5150 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02702
U 1 1 61A98858
P 5000 3700
F 0 "#PWR02702" H 5000 3450 50  0001 C CNN
F 1 "GND" H 5005 3527 50  0000 C CNN
F 2 "" H 5000 3700 50  0001 C CNN
F 3 "" H 5000 3700 50  0001 C CNN
	1    5000 3700
	1    0    0    -1  
$EndComp
Connection ~ 5000 3700
Wire Wire Line
	5000 3700 5150 3700
Wire Wire Line
	5150 3050 5550 3050
Connection ~ 5150 3050
Wire Wire Line
	5150 3050 5150 3200
Wire Wire Line
	4150 4850 4150 3100
Wire Wire Line
	4150 3100 4350 3100
Connection ~ 4350 3100
Wire Wire Line
	4350 3100 4350 3000
$Comp
L power:+3V3 #PWR02703
U 1 1 61A9BE75
P 5750 3950
F 0 "#PWR02703" H 5750 3800 50  0001 C CNN
F 1 "+3V3" H 5765 4123 50  0000 C CNN
F 2 "" H 5750 3950 50  0001 C CNN
F 3 "" H 5750 3950 50  0001 C CNN
	1    5750 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2704
U 1 1 61A9D08F
P 5750 4300
F 0 "C2704" V 5650 4250 50  0000 L CNN
F 1 "1 uF 10% 10V" V 5850 4150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5750 4300 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KPFNNNE.jsp" H 5750 4300 50  0001 C CNN
F 4 "1276-1275-1-ND" H 5750 4300 50  0001 C CNN "Digikey PN"
F 5 "Samsung Electro-Mechanics" H 5750 4300 50  0001 C CNN "MFG"
F 6 "CL21B105KPFNNNE" H 5750 4300 50  0001 C CNN "MFG #"
	1    5750 4300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR02704
U 1 1 61A9DB32
P 5750 4450
F 0 "#PWR02704" H 5750 4200 50  0001 C CNN
F 1 "GND" H 5755 4277 50  0000 C CNN
F 2 "" H 5750 4450 50  0001 C CNN
F 3 "" H 5750 4450 50  0001 C CNN
	1    5750 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2705
U 1 1 61AA1E17
P 7150 4350
F 0 "C2705" V 7100 4400 50  0000 L CNN
F 1 "1 uF 10% 10V" V 7200 4400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7150 4350 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KPFNNNE.jsp" H 7150 4350 50  0001 C CNN
F 4 "1276-1275-1-ND" H 7150 4350 50  0001 C CNN "Digikey PN"
F 5 "Samsung Electro-Mechanics" H 7150 4350 50  0001 C CNN "MFG"
F 6 "CL21B105KPFNNNE" H 7150 4350 50  0001 C CNN "MFG #"
	1    7150 4350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR02712
U 1 1 61AA39D4
P 7800 4250
F 0 "#PWR02712" H 7800 4000 50  0001 C CNN
F 1 "GND" V 7805 4122 50  0000 R CNN
F 2 "" H 7800 4250 50  0001 C CNN
F 3 "" H 7800 4250 50  0001 C CNN
	1    7800 4250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR02706
U 1 1 61AA48B6
P 6700 4350
F 0 "#PWR02706" H 6700 4100 50  0001 C CNN
F 1 "GND" V 6705 4222 50  0000 R CNN
F 2 "" H 6700 4350 50  0001 C CNN
F 3 "" H 6700 4350 50  0001 C CNN
	1    6700 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	6700 4350 7050 4350
$Comp
L Device:C_Small C2706
U 1 1 61AA58CA
P 7150 4550
F 0 "C2706" V 7100 4250 50  0000 L CNN
F 1 "1 uF 10% 10V" V 7200 3950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7150 4550 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KPFNNNE.jsp" H 7150 4550 50  0001 C CNN
F 4 "1276-1275-1-ND" H 7150 4550 50  0001 C CNN "Digikey PN"
F 5 "Samsung Electro-Mechanics" H 7150 4550 50  0001 C CNN "MFG"
F 6 "CL21B105KPFNNNE" H 7150 4550 50  0001 C CNN "MFG #"
	1    7150 4550
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C2709
U 1 1 61AAAB7A
P 7400 3050
F 0 "C2709" V 7350 3100 50  0000 L CNN
F 1 "1 uF 10% 10V" V 7450 3100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7400 3050 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KPFNNNE.jsp" H 7400 3050 50  0001 C CNN
F 4 "1276-1275-1-ND" H 7400 3050 50  0001 C CNN "Digikey PN"
F 5 "Samsung Electro-Mechanics" H 7400 3050 50  0001 C CNN "MFG"
F 6 "CL21B105KPFNNNE" H 7400 3050 50  0001 C CNN "MFG #"
	1    7400 3050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR02710
U 1 1 61AAB511
P 7000 3050
F 0 "#PWR02710" H 7000 2800 50  0001 C CNN
F 1 "GND" V 7005 2922 50  0000 R CNN
F 2 "" H 7000 3050 50  0001 C CNN
F 3 "" H 7000 3050 50  0001 C CNN
	1    7000 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 2950 5900 3050
Wire Wire Line
	6600 2850 6600 3050
Wire Wire Line
	6600 3050 5900 3050
Wire Wire Line
	6600 2850 7800 2850
Connection ~ 5900 3050
Wire Wire Line
	5900 3050 5900 3200
Wire Wire Line
	7000 3050 7300 3050
Wire Wire Line
	7500 3050 7800 3050
$Comp
L power:GND #PWR02711
U 1 1 61AADB6B
P 7800 3350
F 0 "#PWR02711" H 7800 3100 50  0001 C CNN
F 1 "GND" V 7805 3222 50  0000 R CNN
F 2 "" H 7800 3350 50  0001 C CNN
F 3 "" H 7800 3350 50  0001 C CNN
	1    7800 3350
	0    1    1    0   
$EndComp
Text GLabel 7300 3850 0    50   Input ~ 0
SPI_SCLK_3V
Text GLabel 7300 3950 0    50   Input ~ 0
SPI_MOSI_3V
Text HLabel 7300 3750 0    50   Input ~ 0
DS_CS_3V3
Text HLabel 7300 3650 0    50   Input ~ 0
DS_D_C_3V3
Text HLabel 7300 3250 0    50   Input ~ 0
DS_BUSY_3V3
Wire Wire Line
	5550 3050 5550 4650
Wire Wire Line
	5550 4650 7800 4650
$Comp
L power:GND #PWR02707
U 1 1 61A37FEC
P 6700 4550
F 0 "#PWR02707" H 6700 4300 50  0001 C CNN
F 1 "GND" V 6705 4422 50  0000 R CNN
F 2 "" H 6700 4550 50  0001 C CNN
F 3 "" H 6700 4550 50  0001 C CNN
	1    6700 4550
	0    1    1    0   
$EndComp
Text Label 7450 2750 0    50   ~ 0
DS_GDR
Text Label 7450 2850 0    50   ~ 0
DS_RESE
Text Label 7500 3050 0    50   ~ 0
DS_VDHR
Wire Wire Line
	7300 3250 7300 3450
Wire Wire Line
	7300 3450 7800 3450
Text Label 7350 3450 0    50   ~ 0
DS_BUSY
Text Label 7350 3550 0    50   ~ 0
DS_BS1
Wire Wire Line
	7300 3650 7800 3650
Wire Wire Line
	7800 3750 7300 3750
Text Label 7350 3650 0    50   ~ 0
DS_D_C
Text Label 7350 3750 0    50   ~ 0
DS_CS
Wire Wire Line
	7300 3850 7800 3850
Wire Wire Line
	7800 3950 7300 3950
Text Label 7350 4050 0    50   ~ 0
DS_VDDIO
Text Label 7350 4350 0    50   ~ 0
DS_VDDD
Wire Wire Line
	6700 4550 7050 4550
Wire Wire Line
	7250 4350 7800 4350
Wire Wire Line
	7250 4550 7800 4550
Text Label 7350 4550 0    50   ~ 0
DS_VSH
Text Label 7350 4650 0    50   ~ 0
DS_VGH
$Comp
L Device:C_Small C2707
U 1 1 61AA7346
P 7150 4750
F 0 "C2707" V 7100 4800 50  0000 L CNN
F 1 "1 uF 10% 10V" V 7200 4800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7150 4750 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KPFNNNE.jsp" H 7150 4750 50  0001 C CNN
F 4 "1276-1275-1-ND" H 7150 4750 50  0001 C CNN "Digikey PN"
F 5 "Samsung Electro-Mechanics" H 7150 4750 50  0001 C CNN "MFG"
F 6 "CL21B105KPFNNNE" H 7150 4750 50  0001 C CNN "MFG #"
	1    7150 4750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6700 4750 7050 4750
$Comp
L power:GND #PWR02708
U 1 1 61AA7F23
P 6700 4750
F 0 "#PWR02708" H 6700 4500 50  0001 C CNN
F 1 "GND" V 6705 4622 50  0000 R CNN
F 2 "" H 6700 4750 50  0001 C CNN
F 3 "" H 6700 4750 50  0001 C CNN
	1    6700 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	7250 4750 7800 4750
$Comp
L Device:C_Small C2708
U 1 1 61AA8D03
P 7150 4950
F 0 "C2708" V 7100 5000 50  0000 L CNN
F 1 "1 uF 10% 10V" V 7200 5000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7150 4950 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KPFNNNE.jsp" H 7150 4950 50  0001 C CNN
F 4 "1276-1275-1-ND" H 7150 4950 50  0001 C CNN "Digikey PN"
F 5 "Samsung Electro-Mechanics" H 7150 4950 50  0001 C CNN "MFG"
F 6 "CL21B105KPFNNNE" H 7150 4950 50  0001 C CNN "MFG #"
	1    7150 4950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR02709
U 1 1 61AA9A69
P 6700 4950
F 0 "#PWR02709" H 6700 4700 50  0001 C CNN
F 1 "GND" V 6705 4822 50  0000 R CNN
F 2 "" H 6700 4950 50  0001 C CNN
F 3 "" H 6700 4950 50  0001 C CNN
	1    6700 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	6700 4950 7050 4950
Wire Wire Line
	7250 4950 7800 4950
Text Label 7350 4750 0    50   ~ 0
DS_VSL
Text Label 7350 4850 0    50   ~ 0
DS_VGL
Text Label 7350 4950 0    50   ~ 0
DS_VCOM
Wire Wire Line
	4150 4850 7800 4850
Text Label 5450 2550 0    50   ~ 0
DS_MOSFET_S
Text Label 5900 3150 0    50   ~ 0
DS_MOSFET_D
Wire Wire Line
	7800 4150 7200 4150
Wire Wire Line
	7200 4150 7200 4100
Wire Wire Line
	7200 4050 7800 4050
Wire Wire Line
	5750 3950 5750 4100
Wire Wire Line
	5750 4450 5750 4400
Wire Wire Line
	7200 4100 5750 4100
Connection ~ 7200 4100
Wire Wire Line
	7200 4100 7200 4050
Connection ~ 5750 4100
Wire Wire Line
	5750 4100 5750 4200
Wire Wire Line
	4750 2550 4850 2550
Wire Wire Line
	4550 2550 4400 2550
Text HLabel 7300 3550 0    50   Input ~ 0
DS_RESET#_3V3
Wire Wire Line
	7800 3550 7300 3550
$EndSCHEMATC
