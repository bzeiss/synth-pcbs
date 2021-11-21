EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Connector_Generic:Conn_01x01 P6
U 1 1 5DD07D72
P 5050 2400
F 0 "P6" H 5130 2442 50  0000 L CNN
F 1 "Conn_01x01" H 5130 2351 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 5050 2400 50  0001 C CNN
F 3 "~" H 5050 2400 50  0001 C CNN
	1    5050 2400
	1    0    0    -1  
$EndComp
NoConn ~ 4850 2400
Text Label 5500 3100 2    50   ~ 0
I_R2
Text Label 6100 3000 0    50   ~ 0
I_G2
Text Label 6100 3100 0    50   ~ 0
I_B2
$Comp
L Connector_Generic:Conn_01x01 P7
U 1 1 5E6322BC
P 6050 2400
F 0 "P7" H 6130 2442 50  0000 L CNN
F 1 "Conn_01x01" H 6130 2351 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 6050 2400 50  0001 C CNN
F 3 "~" H 6050 2400 50  0001 C CNN
	1    6050 2400
	1    0    0    -1  
$EndComp
NoConn ~ 5850 2400
NoConn ~ 2550 -700
Text Label 5500 3000 2    50   ~ 0
GND
Text Label 5500 3200 2    50   ~ 0
I_R3
Text Label 5500 3300 2    50   ~ 0
I_G3
Text Label 5500 3400 2    50   ~ 0
I_B3
Text Label 6100 3200 0    50   ~ 0
I_SYNC
Text Label 6100 3300 0    50   ~ 0
I_VSYNC
$Comp
L buffer-rescue:Conn_01x04_CUSTOM_EVEN-Connector_Generic P5
U 1 1 5E6A62E5
P 5900 3100
F 0 "P5" H 5750 2700 50  0000 C CNN
F 1 "Conn_01x04_CUSTOM_EVEN" H 5450 2600 50  0000 C CNN
F 2 "Connector_Harwin:Harwin_M20-89004xx_1x04_P2.54mm_Horizontal_CUSTOM_EVEN" H 5900 3100 50  0001 C CNN
F 3 "~" H 5900 3100 50  0001 C CNN
	1    5900 3100
	-1   0    0    -1  
$EndComp
$Comp
L buffer-rescue:Conn_01x05_CUSTOM_ODD-Connector_Generic P4
U 1 1 5E6A8473
P 5700 3200
F 0 "P4" H 5200 2900 50  0000 L CNN
F 1 "Conn_01x05_CUSTOM_ODD" H 4800 2800 50  0000 L CNN
F 2 "Connector_Harwin:Harwin_M20-89005xx_1x05_P2.54mm_Horizontal_CUSTOM_ODD" H 5700 3200 50  0001 C CNN
F 3 "~" H 5700 3200 50  0001 C CNN
	1    5700 3200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS245 U1
U 1 1 5E6CBF98
P 5400 4900
F 0 "U1" H 5400 5950 50  0000 C CNN
F 1 "74LS245" H 5400 5850 50  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 5400 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 5400 4900 50  0001 C CNN
	1    5400 4900
	1    0    0    -1  
$EndComp
Text Label 5400 4100 0    50   ~ 0
VCC
Text Label 5400 5700 0    50   ~ 0
GND
Wire Wire Line
	4700 5700 4900 5700
Wire Wire Line
	4900 5300 4900 5400
Text Label 5900 4400 0    50   ~ 0
I_B3
Text Label 5900 4500 0    50   ~ 0
I_VSYNC
Text Label 5900 4600 0    50   ~ 0
I_G3
Text Label 4900 4400 2    50   ~ 0
B3
Text Label 4900 4500 2    50   ~ 0
VSYNC
Text Label 4900 4600 2    50   ~ 0
G3
Text Label 4900 4700 2    50   ~ 0
SYNC
Text Label 4900 4800 2    50   ~ 0
R3
Text Label 4900 4900 2    50   ~ 0
B2
Text Label 4900 5000 2    50   ~ 0
R2
Text Label 4900 5100 2    50   ~ 0
G2
Text Label 5900 4700 0    50   ~ 0
I_SYNC
Text Label 5900 4800 0    50   ~ 0
I_R3
Text Label 5900 4900 0    50   ~ 0
I_B2
Text Label 5900 5000 0    50   ~ 0
I_R2
Text Label 5900 5100 0    50   ~ 0
I_G2
$Comp
L Device:C_Small C1
U 1 1 5E6D4BDE
P 4600 5700
F 0 "C1" V 4371 5700 50  0000 C CNN
F 1 "100n" V 4462 5700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4600 5700 50  0001 C CNN
F 3 "~" H 4600 5700 50  0001 C CNN
	1    4600 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	4500 5700 4250 5700
Wire Wire Line
	4250 5700 4250 5550
Wire Wire Line
	4250 4100 5400 4100
Wire Wire Line
	4900 5400 4900 5700
Connection ~ 4900 5400
Connection ~ 4900 5700
Wire Wire Line
	4900 5700 5200 5700
$Comp
L Device:R_Network04 RN1
U 1 1 5E6D7B29
P 4800 3300
F 0 "RN1" V 4383 3300 50  0000 C CNN
F 1 "470R" V 4474 3300 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP5" V 5075 3300 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4800 3300 50  0001 C CNN
	1    4800 3300
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Network04 RN2
U 1 1 5E6DADBC
P 6850 3200
F 0 "RN2" V 6433 3200 50  0000 C CNN
F 1 "470R" V 6524 3200 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP5" V 7125 3200 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 6850 3200 50  0001 C CNN
	1    6850 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 3000 7250 3000
Wire Wire Line
	7250 3000 7250 2550
Wire Wire Line
	7250 2550 5150 2550
Wire Wire Line
	4350 2550 4350 3100
Wire Wire Line
	4350 3100 4600 3100
Wire Wire Line
	5500 3000 5150 3000
Wire Wire Line
	5150 3000 5150 2550
Connection ~ 5150 2550
Wire Wire Line
	5150 2550 4350 2550
Wire Wire Line
	5000 3100 5500 3100
Wire Wire Line
	5500 3200 5000 3200
Wire Wire Line
	5500 3300 5000 3300
Wire Wire Line
	5500 3400 5000 3400
Wire Wire Line
	6100 3300 6650 3300
Wire Wire Line
	6100 3200 6650 3200
Wire Wire Line
	6100 3100 6650 3100
Wire Wire Line
	6100 3000 6650 3000
$Comp
L Connector:DIN-8 J1
U 1 1 6199FB16
P 8700 3350
F 0 "J1" H 8700 3950 50  0000 C CNN
F 1 "DIN-8 Female (Symbol has 2 and 8 swapped!)" H 8700 3850 50  0000 C CNN
F 2 "din8-conn:DIN8_5211511-1" H 8700 3350 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/18/40_c091_abd_e-75918.pdf" H 8700 3350 50  0001 C CNN
	1    8700 3350
	1    0    0    -1  
$EndComp
NoConn ~ 9000 3350
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 619A344E
P 4250 5550
F 0 "#FLG0101" H 4250 5625 50  0001 C CNN
F 1 "PWR_FLAG" V 4250 5677 50  0000 L CNN
F 2 "" H 4250 5550 50  0001 C CNN
F 3 "~" H 4250 5550 50  0001 C CNN
	1    4250 5550
	0    -1   -1   0   
$EndComp
Connection ~ 4250 5550
Wire Wire Line
	4250 5550 4250 4100
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 619A4077
P 5200 5700
F 0 "#FLG0102" H 5200 5775 50  0001 C CNN
F 1 "PWR_FLAG" H 5200 5873 50  0000 C CNN
F 2 "" H 5200 5700 50  0001 C CNN
F 3 "~" H 5200 5700 50  0001 C CNN
	1    5200 5700
	-1   0    0    1   
$EndComp
Connection ~ 5200 5700
Wire Wire Line
	5200 5700 5400 5700
NoConn ~ 3600 3000
NoConn ~ 3600 3300
NoConn ~ 3600 3200
NoConn ~ 3600 3100
$Comp
L buffer-rescue:Conn_01x04-Connector_Generic P2
U 1 1 5DCFA861
P 3400 3200
F 0 "P2" H 3400 2750 50  0000 C CNN
F 1 "Conn_01x04" H 3400 2850 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3400 3200 50  0001 C CNN
F 3 "~" H 3400 3200 50  0001 C CNN
	1    3400 3200
	-1   0    0    1   
$EndComp
NoConn ~ 4900 4400
NoConn ~ 4900 4500
NoConn ~ 4900 4600
NoConn ~ 4900 4700
NoConn ~ 4900 4800
NoConn ~ 4900 5100
Text Label 8100 3450 0    50   ~ 0
I_R2
Wire Wire Line
	8400 3450 8100 3450
Text Label 8700 3850 1    50   ~ 0
I_B2
Wire Wire Line
	8700 3850 8700 3650
Text Label 8700 2900 3    50   ~ 0
GND
Wire Wire Line
	8700 3050 8700 2900
Text Label 9350 3450 2    50   ~ 0
I_G2
Wire Wire Line
	9000 3450 9350 3450
Wire Wire Line
	9000 3250 9350 3250
Wire Wire Line
	8400 3250 8100 3250
Text Label 8100 3250 0    50   ~ 0
I_SYNC
Text Label 9350 3250 2    50   ~ 0
I_VSYNC
Wire Wire Line
	8400 3350 8100 3350
NoConn ~ 8100 3350
NoConn ~ 4900 4900
NoConn ~ 4900 5000
$EndSCHEMATC
