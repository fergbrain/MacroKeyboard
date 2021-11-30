EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 18 30
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 4750 2700 0    50   Input ~ 0
D_IN
Wire Wire Line
	4750 2700 4900 2700
Text HLabel 5700 2700 2    50   Output ~ 0
D_OUT
Wire Wire Line
	5700 2700 5500 2700
Wire Wire Line
	5200 3150 5200 3000
$Comp
L power:+5V #PWR01701
U 1 1 61A18EF9
P 5000 2150
AR Path="/61A0B661/61A171D3/61A18EF9" Ref="#PWR01701"  Part="1" 
AR Path="/61A0B661/61A1CCBC/61A18EF9" Ref="#PWR01801"  Part="1" 
AR Path="/61A0B661/61A1CE5F/61A18EF9" Ref="#PWR01901"  Part="1" 
AR Path="/61A0B661/61A1D175/61A18EF9" Ref="#PWR02001"  Part="1" 
AR Path="/61A0B661/61A1D179/61A18EF9" Ref="#PWR02101"  Part="1" 
AR Path="/61A0B661/61A1D17D/61A18EF9" Ref="#PWR02201"  Part="1" 
AR Path="/61A0B661/61A1D839/61A18EF9" Ref="#PWR02301"  Part="1" 
AR Path="/61A0B661/61A1D83D/61A18EF9" Ref="#PWR02401"  Part="1" 
AR Path="/61A0B661/61A1D841/61A18EF9" Ref="#PWR02501"  Part="1" 
AR Path="/61A0B661/61A1D845/61A18EF9" Ref="#PWR02601"  Part="1" 
F 0 "#PWR01801" H 5000 2000 50  0001 C CNN
F 1 "+5V" H 5015 2323 50  0000 C CNN
F 2 "" H 5000 2150 50  0001 C CNN
F 3 "" H 5000 2150 50  0001 C CNN
	1    5000 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1701
U 1 1 61A198EA
P 5450 2250
AR Path="/61A0B661/61A171D3/61A198EA" Ref="C1701"  Part="1" 
AR Path="/61A0B661/61A1CCBC/61A198EA" Ref="C1801"  Part="1" 
AR Path="/61A0B661/61A1CE5F/61A198EA" Ref="C1901"  Part="1" 
AR Path="/61A0B661/61A1D175/61A198EA" Ref="C2001"  Part="1" 
AR Path="/61A0B661/61A1D179/61A198EA" Ref="C2101"  Part="1" 
AR Path="/61A0B661/61A1D17D/61A198EA" Ref="C2201"  Part="1" 
AR Path="/61A0B661/61A1D839/61A198EA" Ref="C2301"  Part="1" 
AR Path="/61A0B661/61A1D83D/61A198EA" Ref="C2401"  Part="1" 
AR Path="/61A0B661/61A1D841/61A198EA" Ref="C2501"  Part="1" 
AR Path="/61A0B661/61A1D845/61A198EA" Ref="C2601"  Part="1" 
F 0 "C1801" V 5221 2250 50  0000 C CNN
F 1 "10 uF 10% 10V" V 5312 2250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5450 2250 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21A106KPCLQNC.jsp" H 5450 2250 50  0001 C CNN
F 4 "1276-2402-1-ND" H 5450 2250 50  0001 C CNN "Digikey PN"
F 5 "Samsung Electro-Mechanics" H 5450 2250 50  0001 C CNN "MFG"
F 6 "CL21A106KPCLQNC" H 5450 2250 50  0001 C CNN "MFG #"
	1    5450 2250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR01702
U 1 1 61A1B1AB
P 5200 3150
AR Path="/61A0B661/61A171D3/61A1B1AB" Ref="#PWR01702"  Part="1" 
AR Path="/61A0B661/61A1CCBC/61A1B1AB" Ref="#PWR01802"  Part="1" 
AR Path="/61A0B661/61A1CE5F/61A1B1AB" Ref="#PWR01902"  Part="1" 
AR Path="/61A0B661/61A1D175/61A1B1AB" Ref="#PWR02002"  Part="1" 
AR Path="/61A0B661/61A1D179/61A1B1AB" Ref="#PWR02102"  Part="1" 
AR Path="/61A0B661/61A1D17D/61A1B1AB" Ref="#PWR02202"  Part="1" 
AR Path="/61A0B661/61A1D839/61A1B1AB" Ref="#PWR02302"  Part="1" 
AR Path="/61A0B661/61A1D83D/61A1B1AB" Ref="#PWR02402"  Part="1" 
AR Path="/61A0B661/61A1D841/61A1B1AB" Ref="#PWR02502"  Part="1" 
AR Path="/61A0B661/61A1D845/61A1B1AB" Ref="#PWR02602"  Part="1" 
F 0 "#PWR01802" H 5200 2900 50  0001 C CNN
F 1 "GND" H 5205 2977 50  0000 C CNN
F 2 "" H 5200 3150 50  0001 C CNN
F 3 "" H 5200 3150 50  0001 C CNN
	1    5200 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01703
U 1 1 61A1B656
P 5750 2350
AR Path="/61A0B661/61A171D3/61A1B656" Ref="#PWR01703"  Part="1" 
AR Path="/61A0B661/61A1CCBC/61A1B656" Ref="#PWR01803"  Part="1" 
AR Path="/61A0B661/61A1CE5F/61A1B656" Ref="#PWR01903"  Part="1" 
AR Path="/61A0B661/61A1D175/61A1B656" Ref="#PWR02003"  Part="1" 
AR Path="/61A0B661/61A1D179/61A1B656" Ref="#PWR02103"  Part="1" 
AR Path="/61A0B661/61A1D17D/61A1B656" Ref="#PWR02203"  Part="1" 
AR Path="/61A0B661/61A1D839/61A1B656" Ref="#PWR02303"  Part="1" 
AR Path="/61A0B661/61A1D83D/61A1B656" Ref="#PWR02403"  Part="1" 
AR Path="/61A0B661/61A1D841/61A1B656" Ref="#PWR02503"  Part="1" 
AR Path="/61A0B661/61A1D845/61A1B656" Ref="#PWR02603"  Part="1" 
F 0 "#PWR01803" H 5750 2100 50  0001 C CNN
F 1 "GND" H 5755 2177 50  0000 C CNN
F 2 "" H 5750 2350 50  0001 C CNN
F 3 "" H 5750 2350 50  0001 C CNN
	1    5750 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2250 5550 2250
Wire Wire Line
	5350 2250 5200 2250
Wire Wire Line
	5200 2250 5200 2400
Wire Wire Line
	5200 2250 5000 2250
Wire Wire Line
	5000 2250 5000 2150
Connection ~ 5200 2250
Text Label 5000 2250 2    50   ~ 0
5V_WS2912B
Wire Wire Line
	5750 2250 5750 2350
$Comp
L Macro_Keyboard:SK6812MINI-E D1701
U 1 1 61A46C26
P 5200 2700
AR Path="/61A0B661/61A171D3/61A46C26" Ref="D1701"  Part="1" 
AR Path="/61A0B661/61A1CCBC/61A46C26" Ref="D1801"  Part="1" 
AR Path="/61A0B661/61A1CE5F/61A46C26" Ref="D1901"  Part="1" 
AR Path="/61A0B661/61A1D175/61A46C26" Ref="D2001"  Part="1" 
AR Path="/61A0B661/61A1D179/61A46C26" Ref="D2101"  Part="1" 
AR Path="/61A0B661/61A1D17D/61A46C26" Ref="D2201"  Part="1" 
AR Path="/61A0B661/61A1D839/61A46C26" Ref="D2301"  Part="1" 
AR Path="/61A0B661/61A1D83D/61A46C26" Ref="D2401"  Part="1" 
AR Path="/61A0B661/61A1D841/61A46C26" Ref="D2501"  Part="1" 
AR Path="/61A0B661/61A1D845/61A46C26" Ref="D2601"  Part="1" 
F 0 "D1801" H 5544 2746 50  0000 L CNN
F 1 "SK6812MINI-E" H 5544 2655 50  0000 L CNN
F 2 "Macro Keyboard:MX_SK6812MINI-E_REV" H 5250 2400 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/4960/4960_SK6812MINI-E_REV02_EN.pdf" H 5300 2325 50  0001 L TNN
F 4 "1528-4960-ND" H 5200 2700 50  0001 C CNN "Digikey PN"
F 5 "Adafruit Industries LLC" H 5200 2700 50  0001 C CNN "MFG"
F 6 "4960" H 5200 2700 50  0001 C CNN "MFG #"
	1    5200 2700
	1    0    0    -1  
$EndComp
$EndSCHEMATC
