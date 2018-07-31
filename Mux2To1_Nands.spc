********************************************************************************
* SPICE netlist generated by HiPer Verify's NetList Extractor
*
* Extract Date/Time:	Mon Jul 30 23:59:23 2018
* L-Edit Version:		L-Edit Win64 16.01.20130408.01:22:50
*
* Rule Set Name:
* TDB File Name:		C:\Users\patri\Desktop\fa-russ\FA_NANDS.tdb
* Command File:		C:\Users\patri\Desktop\fa-russ\ams035.ext
* Cell Name:			Mux2To1_Nands
* Write Flat:			NO
********************************************************************************

.include ami_035u.mod

vcc vcc 0 dc 3.3v
Vgnd GND_ 0 dc 0V


*Vtc TC 0 dc 0V
Va 		A 		0 dc 3.3V
Vb 		B		0 dc 0V

*Vs0 		S0 		0 pulse(0 3.3 0 0.1nS 0.1ns 1ns 2.2ns)
*VScanIn 	ScanIn 	0 pulse(0 3.3 0 0.1nS 0.1ns 2ns 4.4ns)
VSel 		Sel 		0 pulse(0 3.3 0 0.1nS 0.1ns 1ns 2.2ns)

****************************************

M1 1 Sel 2 3 CMOSN l=3e-007 w=2.6e-006  $ (30.05 19.55 30.35 22.15)
M2 GND_ Sel 1 3 CMOSN l=3e-007 w=2.6e-006  $ (31.25 19.55 31.55 22.15)
M3 4 2 5 3 CMOSN l=3e-007 w=2.6e-006  $ (37.1 19.5 37.4 22.1)
M4 GND_ A 4 3 CMOSN l=3e-007 w=2.6e-006  $ (38.3 19.5 38.6 22.1)
M5 6 Sel 7 3 CMOSN l=3e-007 w=2.6e-006  $ (43.55 19.5 43.85 22.1)
M6 GND_ B 6 3 CMOSN l=3e-007 w=2.6e-006  $ (44.75 19.5 45.05 22.1)
M7 8 7 OUT 3 CMOSN l=3e-007 w=2.6e-006  $ (50.15 19.45 50.45 22.05)
M8 GND_ 5 8 3 CMOSN l=3e-007 w=2.6e-006  $ (51.35 19.45 51.65 22.05)
M9 2 Sel VCC 9 CMOSP l=3e-007 w=4.55e-006  $ (30.05 23.9 30.35 28.45)
M10 VCC Sel 2 9 CMOSP l=3e-007 w=4.55e-006  $ (31.25 23.9 31.55 28.45)
M11 5 2 VCC 10 CMOSP l=3e-007 w=4.55e-006  $ (37.1 23.85 37.4 28.4)
M12 VCC A 5 10 CMOSP l=3e-007 w=4.55e-006  $ (38.3 23.85 38.6 28.4)
M13 7 Sel VCC 11 CMOSP l=3e-007 w=4.55e-006  $ (43.55 23.85 43.85 28.4)
M14 VCC B 7 11 CMOSP l=3e-007 w=4.55e-006  $ (44.75 23.85 45.05 28.4)
M15 OUT 7 VCC 12 CMOSP l=3e-007 w=4.55e-006  $ (50.15 23.8 50.45 28.35)
M16 VCC 5 OUT 12 CMOSP l=3e-007 w=4.55e-006  $ (51.35 23.8 51.65 28.35)
* Top level device count
* M(CMOSN)		8
* M(CMOSP)		8
* Number of devices:	16
* Number of nodes:	18


** ondas -------------------------------------------------------------------------------------------
.tran 1ns 8n
.probe

*saidas e i=input
.print v(OUT) v(A) v(B) v(Sel)
.end
