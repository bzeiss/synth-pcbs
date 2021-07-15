EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ERM24064 display adapter for EMU Emulator IV series"
Date "2021-07-15"
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 3300 1900 2    50   Input ~ 0
V0
Text GLabel 1500 2400 0    50   Input ~ 0
~WR
Text GLabel 2350 2400 2    50   Input ~ 0
~RD
Wire Wire Line
	2350 2400 2150 2400
Wire Wire Line
	1500 2400 1650 2400
Text GLabel 1650 2500 0    50   Input ~ 0
~CE
Text GLabel 2150 2500 2    50   Input ~ 0
C_D
Text GLabel 1500 2600 0    50   Input ~ 0
NC
Wire Wire Line
	1500 2600 1650 2600
Text GLabel 2350 2600 2    50   Input ~ 0
~RST
Wire Wire Line
	2150 2600 2350 2600
Text GLabel 1650 2700 0    50   Input ~ 0
DB0
Text GLabel 1650 2800 0    50   Input ~ 0
DB2
Text GLabel 1650 2900 0    50   Input ~ 0
DB4
Text GLabel 1650 3000 0    50   Input ~ 0
DB6
Text GLabel 2150 2700 2    50   Input ~ 0
DB1
Text GLabel 2150 2800 2    50   Input ~ 0
DB3
Text GLabel 2150 2900 2    50   Input ~ 0
DB5
Text GLabel 2150 3000 2    50   Input ~ 0
DB7
Text GLabel 1650 3100 0    50   Input ~ 0
FS
Text GLabel 2150 3100 2    50   Input ~ 0
VOUT
$Comp
L power:GND #PWR0101
U 1 1 60F19BDE
P 1650 2200
F 0 "#PWR0101" H 1650 1950 50  0001 C CNN
F 1 "GND" V 1655 2072 50  0000 R CNN
F 2 "" H 1650 2200 50  0001 C CNN
F 3 "" H 1650 2200 50  0001 C CNN
	1    1650 2200
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0103
U 1 1 60F1A6D2
P 1650 2300
F 0 "#PWR0103" H 1650 2150 50  0001 C CNN
F 1 "+5V" V 1665 2428 50  0000 L CNN
F 2 "" H 1650 2300 50  0001 C CNN
F 3 "" H 1650 2300 50  0001 C CNN
	1    1650 2300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 60F1B3C9
P 4150 2200
F 0 "#PWR0104" H 4150 1950 50  0001 C CNN
F 1 "GND" V 4155 2072 50  0000 R CNN
F 2 "" H 4150 2200 50  0001 C CNN
F 3 "" H 4150 2200 50  0001 C CNN
	1    4150 2200
	0    -1   -1   0   
$EndComp
Text GLabel 4150 2300 2    50   Input ~ 0
V0
Text GLabel 4350 2400 2    50   Input ~ 0
~RD
Text GLabel 4150 2500 2    50   Input ~ 0
C_D
Text GLabel 4350 2600 2    50   Input ~ 0
~RST
Text GLabel 4150 2700 2    50   Input ~ 0
DB1
Text GLabel 4150 2800 2    50   Input ~ 0
DB3
Text GLabel 4150 2900 2    50   Input ~ 0
DB5
Text GLabel 4150 3000 2    50   Input ~ 0
DB7
Text GLabel 4150 3100 2    50   Input ~ 0
VOUT
Text GLabel 3650 3100 0    50   Input ~ 0
FS
Text GLabel 3650 3000 0    50   Input ~ 0
DB6
Text GLabel 3650 2900 0    50   Input ~ 0
DB4
Text GLabel 3650 2800 0    50   Input ~ 0
DB2
Text GLabel 3650 2700 0    50   Input ~ 0
DB0
Text GLabel 3500 2600 0    50   Input ~ 0
NC
Text GLabel 3650 2500 0    50   Input ~ 0
~CE
Text GLabel 3500 2400 0    50   Input ~ 0
~WR
$Comp
L power:+5V #PWR0105
U 1 1 60F1C482
P 3650 2300
F 0 "#PWR0105" H 3650 2150 50  0001 C CNN
F 1 "+5V" V 3665 2428 50  0000 L CNN
F 2 "" H 3650 2300 50  0001 C CNN
F 3 "" H 3650 2300 50  0001 C CNN
	1    3650 2300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 60F1D042
P 3650 2200
F 0 "#PWR0106" H 3650 1950 50  0001 C CNN
F 1 "GND" V 3655 2072 50  0000 R CNN
F 2 "" H 3650 2200 50  0001 C CNN
F 3 "" H 3650 2200 50  0001 C CNN
	1    3650 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 2400 4350 2400
Wire Wire Line
	4150 2600 4350 2600
Wire Wire Line
	3650 2600 3500 2600
Wire Wire Line
	3650 2400 3500 2400
$Comp
L power:GND #PWR0107
U 1 1 60F1DE69
P 750 2500
F 0 "#PWR0107" H 750 2250 50  0001 C CNN
F 1 "GND" H 755 2327 50  0000 C CNN
F 2 "" H 750 2500 50  0001 C CNN
F 3 "" H 750 2500 50  0001 C CNN
	1    750  2500
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 60F1E39F
P 750 3050
F 0 "#PWR0108" H 750 2900 50  0001 C CNN
F 1 "+5V" H 765 3223 50  0000 C CNN
F 2 "" H 750 3050 50  0001 C CNN
F 3 "" H 750 3050 50  0001 C CNN
	1    750  3050
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 60F1E8C1
P 750 2500
F 0 "#FLG0101" H 750 2575 50  0001 C CNN
F 1 "PWR_FLAG" H 750 2673 50  0000 C CNN
F 2 "" H 750 2500 50  0001 C CNN
F 3 "~" H 750 2500 50  0001 C CNN
	1    750  2500
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 60F1F001
P 750 3050
F 0 "#FLG0102" H 750 3125 50  0001 C CNN
F 1 "PWR_FLAG" H 750 3223 50  0000 C CNN
F 2 "" H 750 3050 50  0001 C CNN
F 3 "~" H 750 3050 50  0001 C CNN
	1    750  3050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 60F1A0FB
P 3000 1900
F 0 "#PWR0102" H 3000 1650 50  0001 C CNN
F 1 "GND" H 3005 1727 50  0000 C CNN
F 2 "" H 3000 1900 50  0001 C CNN
F 3 "" H 3000 1900 50  0001 C CNN
	1    3000 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R_POT_TRIM RV1
U 1 1 60F1FCDA
P 3150 1900
F 0 "RV1" V 2943 1900 50  0000 C CNN
F 1 "Trimpot 10k" V 3034 1900 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_ACP_CA9-V10_Vertical" H 3150 1900 50  0001 C CNN
F 3 "~" H 3150 1900 50  0001 C CNN
	1    3150 1900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 60F21A60
P 2150 2200
F 0 "#PWR0109" H 2150 1950 50  0001 C CNN
F 1 "GND" V 2155 2072 50  0000 R CNN
F 2 "" H 2150 2200 50  0001 C CNN
F 3 "" H 2150 2200 50  0001 C CNN
	1    2150 2200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2150 2300 3150 2300
Wire Wire Line
	3150 2300 3150 2050
$Comp
L ERM24064-adapter:ERM24064-1-display J1
U 1 1 60F381EC
P 1850 2600
F 0 "J1" H 1900 3217 50  0000 C CNN
F 1 "ERM24064-1-display" H 1900 3126 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x11_P2.54mm_Vertical" H 1850 2600 50  0001 C CNN
F 3 "~" H 1850 2600 50  0001 C CNN
	1    1850 2600
	1    0    0    -1  
$EndComp
$Comp
L ERM24064-adapter:ERM24064-1-mainboard J2
U 1 1 60F3A593
P 3850 2600
F 0 "J2" H 3900 3217 50  0000 C CNN
F 1 "ERM24064-1-mainboard" H 3900 3126 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x10_P2.54mm_Vertical" H 3850 2600 50  0001 C CNN
F 3 "~" H 3850 2600 50  0001 C CNN
	1    3850 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT_TRIM RV2
U 1 1 60F41176
P 2900 3250
F 0 "RV2" H 2830 3204 50  0000 R CNN
F 1 "Trimpot 1k" H 2830 3295 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_ACP_CA9-V10_Vertical" H 2900 3250 50  0001 C CNN
F 3 "~" H 2900 3250 50  0001 C CNN
	1    2900 3250
	-1   0    0    1   
$EndComp
$Comp
L ERM24064-adapter:Backlight_Connector_Mainboard_CN24 J3
U 1 1 60F4B848
P 2800 3900
F 0 "J3" V 2954 3612 50  0000 R CNN
F 1 "Backlight_Connector_Mainboard_CN24" V 2863 3612 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 2800 3900 50  0001 C CNN
F 3 "~" H 2800 3900 50  0001 C CNN
	1    2800 3900
	0    -1   -1   0   
$EndComp
NoConn ~ 2750 3250
Text GLabel 2900 3050 1    50   Input ~ 0
LED_A
Text GLabel 2800 3700 1    50   Input ~ 0
LED_K
Wire Wire Line
	2900 3700 2900 3400
Wire Wire Line
	2900 3100 2900 3050
Text GLabel 1650 3200 0    50   Input ~ 0
LED_A
Text GLabel 2150 3200 2    50   Input ~ 0
LED_K
$EndSCHEMATC
