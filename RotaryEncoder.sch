EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 29
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 3100 3400 0    50   Output ~ 0
REnc_A
Text HLabel 3100 3800 0    50   Output ~ 0
REnc_B
$Comp
L power:GND #PWR0203
U 1 1 61A23094
P 4700 3600
AR Path="/61A047C3/61A23094" Ref="#PWR0203"  Part="1" 
AR Path="/61A55BF3/61A23094" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4700 3350 50  0001 C CNN
F 1 "GND" H 4600 3600 50  0000 C CNN
F 2 "" H 4700 3600 50  0001 C CNN
F 3 "" H 4700 3600 50  0001 C CNN
	1    4700 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3600 4850 3600
$Comp
L power:+3V3 #PWR0202
U 1 1 61A247A0
P 3950 2850
AR Path="/61A047C3/61A247A0" Ref="#PWR0202"  Part="1" 
AR Path="/61A55BF3/61A247A0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3950 2700 50  0001 C CNN
F 1 "+3V3" H 3965 3023 50  0000 C CNN
F 2 "" H 3950 2850 50  0001 C CNN
F 3 "" H 3950 2850 50  0001 C CNN
	1    3950 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R202
U 1 1 61A24F25
P 3800 3000
AR Path="/61A047C3/61A24F25" Ref="R202"  Part="1" 
AR Path="/61A55BF3/61A24F25" Ref="R?"  Part="1" 
F 0 "R?" H 4000 2950 50  0000 R CNN
F 1 "47k 5%" H 4150 3050 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 3800 3000 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 3800 3000 50  0001 C CNN
F 4 "RMCF0805JT47K0CT-ND" H 3800 3000 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 3800 3000 50  0001 C CNN "MFG"
F 6 "RMCF0805JT47K0" H 3800 3000 50  0001 C CNN "MFG #"
	1    3800 3000
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small_US R204
U 1 1 61A25788
P 4100 3000
AR Path="/61A047C3/61A25788" Ref="R204"  Part="1" 
AR Path="/61A55BF3/61A25788" Ref="R?"  Part="1" 
F 0 "R?" H 4032 2954 50  0000 R CNN
F 1 "47k 5%" H 4032 3045 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 4100 3000 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 4100 3000 50  0001 C CNN
F 4 "RMCF0805JT47K0CT-ND" H 4100 3000 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 4100 3000 50  0001 C CNN "MFG"
F 6 "RMCF0805JT47K0" H 4100 3000 50  0001 C CNN "MFG #"
	1    4100 3000
	-1   0    0    1   
$EndComp
Wire Wire Line
	3950 2850 3800 2850
Wire Wire Line
	3800 2850 3800 2900
Wire Wire Line
	3950 2850 4100 2850
Wire Wire Line
	4100 2850 4100 2900
Connection ~ 3950 2850
$Comp
L Device:R_Small_US R201
U 1 1 61A260B2
P 3600 3400
AR Path="/61A047C3/61A260B2" Ref="R201"  Part="1" 
AR Path="/61A55BF3/61A260B2" Ref="R?"  Part="1" 
F 0 "R?" V 3700 3450 50  0000 R CNN
F 1 "4.7k 5%" V 3500 3550 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 3600 3400 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 3600 3400 50  0001 C CNN
F 4 "RMCF0805JT4K70CT-ND" H 3600 3400 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 3600 3400 50  0001 C CNN "MFG"
F 6 "RMCF0805JT4K70" H 3600 3400 50  0001 C CNN "MFG #"
	1    3600 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3800 3100 3800 3400
Wire Wire Line
	3800 3400 3700 3400
Wire Wire Line
	3800 3400 4850 3400
Connection ~ 3800 3400
Wire Wire Line
	3500 3400 3300 3400
$Comp
L Device:R_Small_US R203
U 1 1 61A2753E
P 3800 3800
AR Path="/61A047C3/61A2753E" Ref="R203"  Part="1" 
AR Path="/61A55BF3/61A2753E" Ref="R?"  Part="1" 
F 0 "R?" V 3900 3850 50  0000 R CNN
F 1 "4.7k 5%" V 3700 3950 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 3800 3800 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 3800 3800 50  0001 C CNN
F 4 "RMCF0805JT4K70CT-ND" H 3800 3800 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 3800 3800 50  0001 C CNN "MFG"
F 6 "RMCF0805JT4K70" H 3800 3800 50  0001 C CNN "MFG #"
	1    3800 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4100 3100 4100 3800
Wire Wire Line
	4100 3800 3900 3800
Wire Wire Line
	4100 3800 4850 3800
Connection ~ 4100 3800
$Comp
L Device:C_Small C201
U 1 1 61A2842D
P 3300 4100
AR Path="/61A047C3/61A2842D" Ref="C201"  Part="1" 
AR Path="/61A55BF3/61A2842D" Ref="C?"  Part="1" 
F 0 "C?" V 3050 4050 50  0000 L CNN
F 1 "1 uF 10% 10V" V 3200 3950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 3300 4100 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KPFNNNE.jsp" H 3300 4100 50  0001 C CNN
F 4 "1276-1275-1-ND" H 3300 4100 50  0001 C CNN "Digikey PN"
F 5 "Samsung Electro-Mechanics" H 3300 4100 50  0001 C CNN "MFG"
F 6 "CL21B105KPFNNNE" H 3300 4100 50  0001 C CNN "MFG #"
	1    3300 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C202
U 1 1 61A29140
P 3500 4100
AR Path="/61A047C3/61A29140" Ref="C202"  Part="1" 
AR Path="/61A55BF3/61A29140" Ref="C?"  Part="1" 
F 0 "C?" V 3250 4050 50  0000 L CNN
F 1 "1 uF 10% 10V" V 3400 3950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 3500 4100 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KPFNNNE.jsp" H 3500 4100 50  0001 C CNN
F 4 "1276-1275-1-ND" H 3500 4100 50  0001 C CNN "Digikey PN"
F 5 "Samsung Electro-Mechanics" H 3500 4100 50  0001 C CNN "MFG"
F 6 "CL21B105KPFNNNE" H 3500 4100 50  0001 C CNN "MFG #"
	1    3500 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	3300 4000 3300 3400
Connection ~ 3300 3400
Wire Wire Line
	3300 3400 3100 3400
Wire Wire Line
	3500 4000 3500 3800
Wire Wire Line
	3500 3800 3700 3800
Wire Wire Line
	3500 3800 3100 3800
Connection ~ 3500 3800
$Comp
L power:GND #PWR0201
U 1 1 61A2A062
P 3400 4400
AR Path="/61A047C3/61A2A062" Ref="#PWR0201"  Part="1" 
AR Path="/61A55BF3/61A2A062" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3400 4150 50  0001 C CNN
F 1 "GND" H 3405 4227 50  0000 C CNN
F 2 "" H 3400 4400 50  0001 C CNN
F 3 "" H 3400 4400 50  0001 C CNN
	1    3400 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 4200 3400 4200
Wire Wire Line
	3400 4200 3400 4400
Wire Wire Line
	3500 4200 3400 4200
Connection ~ 3400 4200
$Comp
L power:+5V #PWR0205
U 1 1 61A2B2C7
P 6300 3200
AR Path="/61A047C3/61A2B2C7" Ref="#PWR0205"  Part="1" 
AR Path="/61A55BF3/61A2B2C7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6300 3050 50  0001 C CNN
F 1 "+5V" H 6315 3373 50  0000 C CNN
F 2 "" H 6300 3200 50  0001 C CNN
F 3 "" H 6300 3200 50  0001 C CNN
	1    6300 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3200 6300 3300
Wire Wire Line
	6300 3300 6050 3300
$Comp
L TMPCB_R2:ENCODER-RGB-SWITCH S201
U 1 1 61A0A08E
P 5450 3600
AR Path="/61A047C3/61A0A08E" Ref="S201"  Part="1" 
AR Path="/61A55BF3/61A0A08E" Ref="S?"  Part="1" 
F 0 "S?" H 5450 4260 45  0000 C CNN
F 1 "ENCODER-RGB-SWITCH" H 5450 4176 45  0000 C CNN
F 2 "ENCODER_LED_3" H 5450 4150 20  0001 C CNN
F 3 "" H 5450 3600 50  0001 C CNN
F 4 "RES-10859" H 5450 4081 60  0000 C CNN "Field4"
F 5 "Need from TeachMePCB" H 5450 3600 50  0001 C CNN "Notes"
	1    5450 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R205
U 1 1 61A2CA50
P 6150 3600
AR Path="/61A047C3/61A2CA50" Ref="R205"  Part="1" 
AR Path="/61A55BF3/61A2CA50" Ref="R?"  Part="1" 
F 0 "R?" V 5945 3600 50  0000 C CNN
F 1 "150 5%" V 6036 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 6150 3600 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 6150 3600 50  0001 C CNN
F 4 "RMCF0805JT150RCT-ND" H 6150 3600 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 6150 3600 50  0001 C CNN "MFG"
F 6 "RMCF0805JT150R" H 6150 3600 50  0001 C CNN "MFG #"
	1    6150 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R208
U 1 1 61A2D457
P 7000 3700
AR Path="/61A047C3/61A2D457" Ref="R208"  Part="1" 
AR Path="/61A55BF3/61A2D457" Ref="R?"  Part="1" 
F 0 "R?" V 6795 3700 50  0000 C CNN
F 1 "68 5%" V 6886 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 7000 3700 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 7000 3700 50  0001 C CNN
F 4 "RMCF0805JT68R0CT-ND" H 7000 3700 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 7000 3700 50  0001 C CNN "MFG"
F 6 "RMCF0805JT68R0" H 7000 3700 50  0001 C CNN "MFG #"
	1    7000 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R209
U 1 1 61A2DABE
P 7900 3800
AR Path="/61A047C3/61A2DABE" Ref="R209"  Part="1" 
AR Path="/61A55BF3/61A2DABE" Ref="R?"  Part="1" 
F 0 "R?" V 7695 3800 50  0000 C CNN
F 1 "68 5%" V 7786 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 7900 3800 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 7900 3800 50  0001 C CNN
F 4 "RMCF0805JT68R0CT-ND" H 7900 3800 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 7900 3800 50  0001 C CNN "MFG"
F 6 "RMCF0805JT68R0" H 7900 3800 50  0001 C CNN "MFG #"
	1    7900 3800
	0    1    1    0   
$EndComp
Text HLabel 6250 3600 2    50   Output ~ 0
REnc_LED_R_5V
Text HLabel 7100 3700 2    50   Output ~ 0
REnc_LED_G_5V
Text HLabel 8000 3800 2    50   Output ~ 0
REnc_LED_B_5V
Wire Wire Line
	6900 3700 6050 3700
Wire Wire Line
	6050 3800 7800 3800
$Comp
L Device:R_Small_US R206
U 1 1 61A33A90
P 6400 4250
AR Path="/61A047C3/61A33A90" Ref="R206"  Part="1" 
AR Path="/61A55BF3/61A33A90" Ref="R?"  Part="1" 
F 0 "R?" H 6332 4204 50  0000 R CNN
F 1 "2.7k 5%" H 6332 4295 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 6400 4250 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 6400 4250 50  0001 C CNN
F 4 "RMCF0805JT2K70CT-ND" H 6400 4250 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 6400 4250 50  0001 C CNN "MFG"
F 6 "RMCF0805JT2K70" H 6400 4250 50  0001 C CNN "MFG #"
	1    6400 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small_US R207
U 1 1 61A34096
P 6400 4700
AR Path="/61A047C3/61A34096" Ref="R207"  Part="1" 
AR Path="/61A55BF3/61A34096" Ref="R?"  Part="1" 
F 0 "R?" H 6332 4654 50  0000 R CNN
F 1 "4.7k 5%" H 6332 4745 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 6400 4700 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 6400 4700 50  0001 C CNN
F 4 "RMCF0805JT4K70CT-ND" H 6400 4700 50  0001 C CNN "Digikey PN"
F 5 "Stackpole Electronics Inc" H 6400 4700 50  0001 C CNN "MFG"
F 6 "RMCF0805JT4K70" H 6400 4700 50  0001 C CNN "MFG #"
	1    6400 4700
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C203
U 1 1 61A34367
P 5950 4700
AR Path="/61A047C3/61A34367" Ref="C203"  Part="1" 
AR Path="/61A55BF3/61A34367" Ref="C?"  Part="1" 
F 0 "C?" V 5700 4650 50  0000 L CNN
F 1 "1 uF 10% 10V" V 5850 4550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5950 4700 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KPFNNNE.jsp" H 5950 4700 50  0001 C CNN
F 4 "1276-1275-1-ND" H 5950 4700 50  0001 C CNN "Digikey PN"
F 5 "Samsung Electro-Mechanics" H 5950 4700 50  0001 C CNN "MFG"
F 6 "CL21B105KPFNNNE" H 5950 4700 50  0001 C CNN "MFG #"
	1    5950 4700
	-1   0    0    1   
$EndComp
Wire Wire Line
	6050 3900 6400 3900
Wire Wire Line
	6400 3900 6400 4150
Wire Wire Line
	6400 4350 6400 4450
Wire Wire Line
	5950 4600 5950 4550
Wire Wire Line
	5950 4450 6400 4450
Connection ~ 6400 4450
Wire Wire Line
	6400 4450 6400 4600
Wire Wire Line
	5950 4800 5950 5100
Wire Wire Line
	5950 5100 6200 5100
$Comp
L power:GND #PWR0204
U 1 1 61A367C9
P 6200 5200
AR Path="/61A047C3/61A367C9" Ref="#PWR0204"  Part="1" 
AR Path="/61A55BF3/61A367C9" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6200 4950 50  0001 C CNN
F 1 "GND" H 6205 5027 50  0000 C CNN
F 2 "" H 6200 5200 50  0001 C CNN
F 3 "" H 6200 5200 50  0001 C CNN
	1    6200 5200
	1    0    0    -1  
$EndComp
Text HLabel 5650 4550 0    50   Output ~ 0
REnc_SW
Wire Wire Line
	5650 4550 5950 4550
Connection ~ 5950 4550
Wire Wire Line
	5950 4550 5950 4450
Connection ~ 6200 5100
Wire Wire Line
	6200 5100 6400 5100
Wire Wire Line
	6400 5100 6400 4800
Wire Wire Line
	6200 5100 6200 5200
$EndSCHEMATC
