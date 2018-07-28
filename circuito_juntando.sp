* 
.include NMOS_VTG.inc

.include PMOS_VTG.inc
*

vdd vdd 0 dc 1.0
Vin in 0 pulse(0 1 0 0.1nS 0.1ns 2ns 4.2ns)

*A seguir SUBCKT do flip flop D
**---------------------------------------------------------------------------
.SUBCKT FFD CLK D out VCC GND
*.PININFO CLK:I D:I out:O VCC:P GND:G
*.EQN out=(D + !CLK);
MP1 out not_D VCC VCC PMOS
MP2 out CLK VCC VCC PMOS 
MN3 pd_n1 not_D GND GND NMOS
MN4 out CLK pd_n1 GND NMOS
MP_inv5 not_D D VCC VCC PMOS
MN_inv6 not_D D GND GND NMOS
.ENDS FFD


.SUBCKT Nand A B out VCC GND
*.PININFO A:I B:I out:O VCC:P GND:G
*.EQN out=(!A + !B);
MP1 out A VCC VCC PMOS
MP2 out B VCC VCC PMOS
MN3 pd_n1 A GND GND NMOS
MN4 out B pd_n1 GND NMOS
.ENDS Nand
**---------------------------------------------------------------------------

** A seguir SUBCKT DO MUX
**---------------------------------------------------------------------------
.SUBCKT Mux A B S not_out VCC GND
*.PININFO A:I B:I S:I not_out:O VCC:P GND:G
*.EQN not_out=!((S + !A) * (!B + !S));
MP1 pu_n5 not_S VCC VCC PMOS
MP2 pu_n5 A VCC VCC PMOS
MP3 out B pu_n5 VCC PMOS
MP4 out S pu_n5 VCC PMOS
MN5 pd_n1 not_S GND GND NMOS
MN6 out A pd_n1 GND NMOS
MN7 pd_n5 B GND GND NMOS
MN8 out S pd_n5 GND NMOS
MP_inv9 not_S S VCC VCC PMOS
MN_inv10 not_S S GND GND NMOS
MP_inv11 not_out out VCC VCC PMOS
MN_inv12 not_out out GND GND NMOS
.ENDS Mux
**---------------------------------------------------------------------------

**A seguir o SUBCKT do FULL ADDER
**---------------------------------------------------------------------------
**subckt do c_out do somador completo
**c_out são os carry outs dos somadores completos
**cout = a*b + a*cin + b*cin

.SUBCKT c_SC a b cin not_out vcc gnd
*.PININFO a:I b:I cin:I not_out:O vcc:P gnd:G
*.EQN not_out=!((!cin * !a) + (!b * a * !cin) + (!b * cin * !a));
MP1 out a pu_n1 vcc 					PMOS 	w='w_pmos'	l='length'
MP2 out not_a pu_n3 vcc 			PMOS 	w='w_pmos'	l='length'
MP3 pu_n1 cin vcc vcc 				PMOS 	w='w_pmos'	l='length'
MP4 pu_n1 not_cin pu_n5 vcc		PMOS 	w='w_pmos'	l='length'
MP5 pu_n5 b vcc vcc 					PMOS 	w='w_pmos'	l='length'
MP6 pu_n3 cin pu_n5 vcc 			PMOS 	w='w_pmos'	l='length'
MN7 out not_a pd_n1 gnd 			NMOS 	w='W_nmos' 	l='length'
MN8 out a pd_n3 gnd 					NMOS 	w='W_nmos' 	l='length'
MN9 pd_n1 cin pd_n4 gnd 			NMOS 	w='W_nmos' 	l='length'
MN10 pd_n4 b gnd gnd 				NMOS 	w='W_nmos' 	l='length'
MN11 pd_n3 not_cin pd_n4 gnd 		NMOS 	w='W_nmos' 	l='length'
MN12 pd_n3 cin gnd gnd 				NMOS 	w='W_nmos' 	l='length'
MP_inv13 not_a a vcc vcc		 	PMOS 	w='w_pmos'	l='length'
MN_inv14 not_a a gnd gnd 			NMOS 	w='W_nmos' 	l='length'
MP_inv15 not_cin cin vcc vcc 		PMOS 	w='w_pmos'	l='length'
MN_inv16 not_cin cin gnd gnd 		NMOS 	w='W_nmos' 	l='length'
MP_inv17 not_out out vcc vcc 		PMOS 	w='w_pmos'	l='length'
MN_inv18 not_out out gnd gnd 		NMOS 	w='W_nmos' 	l='length'
.ENDS c_SC


**---------------------------------------------------------------------------
** subckt da saida do somador completo
**s = cin XOR a XOR b

.SUBCKT saida_SC a b cin out vdd gnd
*.PININFO a:I b:I cin:I out:O vdd:P gnd:G
*.EQN out=((b * !cin * !a) + (!b * cin * !a) + (b * cin * a) + (!b * !cin * a));
MP1 out a pu_n1 vdd 					PMOS 	w='w_pmos'	l='length'
MP2 out not_a pu_n3 vdd 			PMOS 	w='w_pmos'	l='length'
MP3 pu_n1 cin pu_n4 vdd 			PMOS 	w='w_pmos'	l='length'
MP4 pu_n1 not_cin pu_n5 vdd		PMOS 	w='w_pmos'	l='length'
MP5 pu_n4 not_b vdd vdd 			PMOS 	w='w_pmos'	l='length'
MP6 pu_n5 b vdd vdd 					PMOS 	w='w_pmos'	l='length'
MP7 pu_n3 cin pu_n5 vdd 			PMOS 	w='w_pmos'	l='length'
MP8 pu_n3 not_cin pu_n4 vdd	 	PMOS 	w='w_pmos'	l='length'
MN9 out not_a pd_n1 gnd 			NMOS 	w='W_nmos' 	l='length'
MN10 out a pd_n3 gnd 				NMOS 	w='W_nmos' 	l='length'
MN11 pd_n1 not_cin pd_n4 gnd 		NMOS 	w='W_nmos' 	l='length'
MN12 pd_n1 cin pd_n5 gnd 			NMOS 	w='W_nmos' 	l='length'
MN13 pd_n4 not_b gnd gnd 			NMOS 	w='W_nmos' 	l='length'
MN14 pd_n5 b gnd gnd 				NMOS 	w='W_nmos' 	l='length'
MN15 pd_n3 not_cin pd_n5 gnd 		NMOS 	w='W_nmos' 	l='length'
MN16 pd_n3 cin pd_n4 gnd 			NMOS 	w='W_nmos' 	l='length'
MP_inv17 not_a a vdd vdd 			PMOS 	w='w_pmos'	l='length'
MN_inv18 not_a a gnd gnd 			NMOS 	w='W_nmos' 	l='length'
MP_inv19 not_b b vdd vdd 			PMOS 	w='w_pmos'	l='length'
MN_inv20 not_b b gnd gnd 			NMOS 	w='W_nmos' 	l='length'
MP_inv21 not_cin cin vdd vdd 		PMOS 	w='w_pmos'	l='length'
MN_inv22 not_cin cin gnd gnd 		NMOS 	w='W_nmos' 	l='length'
.ENDS saida_SC


**Conexões
**-----------------------------------------------------------------------------
** Entrada de teste a = 11 , B = 10
**Xnumero entrada(s) saida(s) vcc gnd nome da celula

**entrada = a b g0(gnd) 
X1 in 0 gnd s0 vdd gnd saida_SC	**saida = s1 do full adder

*entrada = a b c0(gnd) saida c1
X2 in 0 gnd c1 vdd gnd c_SC 		**sada = c1 do full adder

*entrada = a b c1
X3 in in c1 s1 vdd gnd saida_SC	**saida = s2 do full adder

*entrada = a b c1
X4 in in c1 c2 vdd gnd c_SC 		**saida = c2 do full adder
**---------------------------------------------------------------------------
.tran 1ps 8n

.measure tran pHL_s0 	trig v(in)  	val=0.5 		rise = 1 
+               		  	targ v(s0) 	val=0.5     fall = 1		
	 
.measure tran pLH_s0 	trig v(in) 	 	val=0.5 		fall = 1 
+                    	targ v(s0) 	val=0.5     rise = 1

.measure tran pHL_s1 	trig v(in)  	val=0.5 		rise = 1 
+               		  	targ v(s1) 	val=0.5     fall = 1		
	 
.measure tran pLH_s1 	trig v(in) 	 	val=0.5 		fall = 1 
+                    	targ v(s1) 	val=0.5     rise = 1


.measure tran consumoCaso1_HL integ 'p(vdd)*(3-1.1)' from=1.1N to=3N
.measure tran consumoCaso1_LH integ 'p(vdd)*(5-3.1)' from=3.1N to=5N
*.measure tran consumoCaso1_HL integ 'p(vcc)*(fimIntervJan1-inicioIntervJan1)' from=3.1N to=5N

.param length = '0.2u'

.param w_pmos = '0.8u * 2'
.param W_nmos = '0.8u'

*saidas e i=input
.print v(s0) v(s1) v(c2)