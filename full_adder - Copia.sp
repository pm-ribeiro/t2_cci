*
.include ams35ps.lib

vdd vdd 0 dc 1.0
Vin in 0 pulse(0 1 0 0.1nS 0.1ns 2ns 4.2ns)

**---------------------------------------------------------------------------
**subckt do c_out do somador completo
**c_out s�o os carry outs dos somadores completos
**cout = a*b + a*cin + b*cin

.SUBCKT c_SC a b cin not_out vcc gnd
*.PININFO a:I b:I cin:I not_out:O vcc:P gnd:G
*.EQN not_out=!((!cin * !a) + (!b * a * !cin) + (!b * cin * !a));
MP1 out a pu_n1 vcc 					modp 	w='w_modp'	l='length'
MP2 out not_a pu_n3 vcc 			modp 	w='w_modp'	l='length'
MP3 pu_n1 cin vcc vcc 				modp 	w='w_modp'	l='length'
MP4 pu_n1 not_cin pu_n5 vcc		modp 	w='w_modp'	l='length'
MP5 pu_n5 b vcc vcc 					modp 	w='w_modp'	l='length'
MP6 pu_n3 cin pu_n5 vcc 			modp 	w='w_modp'	l='length'
MN7 out not_a pd_n1 gnd 			modn 	w='W_modn' 	l='length'
MN8 out a pd_n3 gnd 					modn 	w='W_modn' 	l='length'
MN9 pd_n1 cin pd_n4 gnd 			modn 	w='W_modn' 	l='length'
MN10 pd_n4 b gnd gnd 				modn 	w='W_modn' 	l='length'
MN11 pd_n3 not_cin pd_n4 gnd 		modn 	w='W_modn' 	l='length'
MN12 pd_n3 cin gnd gnd 				modn 	w='W_modn' 	l='length'
MP_inv13 not_a a vcc vcc		 	modp 	w='w_modp'	l='length'
MN_inv14 not_a a gnd gnd 			modn 	w='W_modn' 	l='length'
MP_inv15 not_cin cin vcc vcc 		modp 	w='w_modp'	l='length'
MN_inv16 not_cin cin gnd gnd 		modn 	w='W_modn' 	l='length'
MP_inv17 not_out out vcc vcc 		modp 	w='w_modp'	l='length'
MN_inv18 not_out out gnd gnd 		modn 	w='W_modn' 	l='length'
.ENDS c_SC


**---------------------------------------------------------------------------
** subckt da saida do somador completo
**s = cin XOR a XOR b

.SUBCKT saida_SC a b cin out vdd gnd
*.PININFO a:I b:I cin:I out:O vdd:P gnd:G
*.EQN out=((b * !cin * !a) + (!b * cin * !a) + (b * cin * a) + (!b * !cin * a));
MP1 out a pu_n1 vdd 					modp 	w='w_modp'	l='length'
MP2 out not_a pu_n3 vdd 			modp 	w='w_modp'	l='length'
MP3 pu_n1 cin pu_n4 vdd 			modp 	w='w_modp'	l='length'
MP4 pu_n1 not_cin pu_n5 vdd		modp 	w='w_modp'	l='length'
MP5 pu_n4 not_b vdd vdd 			modp 	w='w_modp'	l='length'
MP6 pu_n5 b vdd vdd 					modp 	w='w_modp'	l='length'
MP7 pu_n3 cin pu_n5 vdd 			modp 	w='w_modp'	l='length'
MP8 pu_n3 not_cin pu_n4 vdd	 	modp 	w='w_modp'	l='length'
MN9 out not_a pd_n1 gnd 			modn 	w='W_modn' 	l='length'
MN10 out a pd_n3 gnd 				modn 	w='W_modn' 	l='length'
MN11 pd_n1 not_cin pd_n4 gnd 		modn 	w='W_modn' 	l='length'
MN12 pd_n1 cin pd_n5 gnd 			modn 	w='W_modn' 	l='length'
MN13 pd_n4 not_b gnd gnd 			modn 	w='W_modn' 	l='length'
MN14 pd_n5 b gnd gnd 				modn 	w='W_modn' 	l='length'
MN15 pd_n3 not_cin pd_n5 gnd 		modn 	w='W_modn' 	l='length'
MN16 pd_n3 cin pd_n4 gnd 			modn 	w='W_modn' 	l='length'
MP_inv17 not_a a vdd vdd 			modp 	w='w_modp'	l='length'
MN_inv18 not_a a gnd gnd 			modn 	w='W_modn' 	l='length'
MP_inv19 not_b b vdd vdd 			modp 	w='w_modp'	l='length'
MN_inv20 not_b b gnd gnd 			modn 	w='W_modn' 	l='length'
MP_inv21 not_cin cin vdd vdd 		modp 	w='w_modp'	l='length'
MN_inv22 not_cin cin gnd gnd 		modn 	w='W_modn' 	l='length'
.ENDS saida_SC

*capacitor
*C0 s0 0 1.5fF
*C2 s1 0 1.5fF

*C3 c1 0 1.5fF
*C5 c2 0 1.5fF

* A = 0111 , B = 0100
*Xnumero entrada(s) saida(s) vcc gnd nome da celula
*entrada = a b g0(gnd)
X1 in 0 gnd s0 vdd gnd saida_SC	**saida = s1 do full adder

*entrada = a b c0(gnd) saida c1
X2 in 0 gnd c1 vdd gnd c_SC 		**c1 do full adder

*entrada a b c1
X3 in in c1 s1 vdd gnd saida_SC	**saida = s2 do full adder 2

*c2 =
X4 in in c1 c2 vdd gnd c_SC 		**c2 do full adder
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

.param length = '0.3u'

.param w_modp = '1u * 2'
.param W_modn = '1u'

*saidas e i=input
.print v(s0) v(s1) v(c2)