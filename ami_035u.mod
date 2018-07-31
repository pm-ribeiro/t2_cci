* SPICE 3f5 Level 8, Star-HSPICE Level 49, UTMOST Level 8

* DATE: Sep 14/04
* LOT: T46W                  WAF: 1102
* Temperature_parameters=Default
.MODEL CMOSN NMOS (                                LEVEL   = 49
+VERSION = 3.1            TNOM    = 27             TOX     = 8E-9
+XJ      = 1E-7           NCH     = 2.2E17         VTH0    = 0.4074928
+K1      = 0.4728294      K2      = 3.621074E-3    K3      = 70.0489524
+K3B     = -10            W0      = 1.830495E-5    NLX     = 2.193565E-7
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 0.802594       DVT1    = 0.4276766      DVT2    = -0.3
+U0      = 361.3464355    UA      = -9.67751E-10   UB      = 2.889157E-18
+UC      = 4.669186E-11   VSAT    = 1.898742E5     A0      = 1.3381235
+AGS     = 0.2592162      B0      = 2.220067E-6    B1      = 5E-6
+KETA    = -9.077245E-3   A1      = 0              A2      = 0.3487525
+RDSW    = 780.376869     PRWG    = 0.0713836      PRWB    = -7.21866E-3
+WR      = 1              WINT    = 1.389179E-7    LINT    = 1.24319E-9
+DWG     = -1.034792E-8   DWB     = 9.824117E-9    VOFF    = -0.0869274
+NFACTOR = 0.7366118      CIT     = 0              CDSC    = 2.4E-4
+CDSCD   = 0              CDSCB   = 0              ETA0    = 0.0346215
+ETAB    = -7.988336E-3   DSUB    = 0.3317286      PCLM    = 1.9546403
+PDIBLC1 = 4.161735E-3    PDIBLC2 = 1.19743E-5     PDIBLCB = 0.1
+DROUT   = 2.748338E-3    PSCBE1  = 7.42428E8      PSCBE2  = 1E-3
+PVAG    = 0              DELTA   = 0.01           RSH     = 3.9
+MOBMOD  = 1              PRT     = 0              UTE     = -1.5
+KT1     = -0.11          KT1L    = 0              KT2     = 0.022
+UA1     = 4.31E-9        UB1     = -7.61E-18      UC1     = -5.6E-11
+AT      = 3.3E4          WL      = 0              WLN     = 1
+WW      = 0              WWN     = 1              WWL     = 0
+LL      = 0              LLN     = 1              LW      = 0
+LWN     = 1              LWL     = 0              CAPMOD  = 2
+XPART   = 0.5            CGDO    = 2.58E-10       CGSO    = 2.58E-10
+CGBO    = 1E-12          CJ      = 1.012513E-3    PB      = 0.8
+MJ      = 0.3510986      CJSW    = 2.862666E-10   PBSW    = 0.8
+MJSW    = 0.1518459      CJSWG   = 1.82E-10       PBSWG   = 0.8
+MJSWG   = 0.1518459      CF      = 0              PVTH0   = -0.0100437
+PRDSW   = -73.5674578    PK2     = 3.087074E-3    WKETA   = 3.003636E-3
+LKETA   = 2.647195E-3     )
*
.MODEL CMOSP PMOS (                                LEVEL   = 49
+VERSION = 3.1            TNOM    = 27             TOX     = 8E-9
+XJ      = 1E-7           NCH     = 8.52E16        VTH0    = -0.6831778
+K1      = 0.3939412      K2      = 0.0308482      K3      = 0
+K3B     = 15.35112       W0      = 1E-5           NLX     = 1E-9
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 1.4617205      DVT1    = 0.3569339      DVT2    = -0.0368562
+U0      = 221.3795636    UA      = 1.573901E-9    UB      = 5E-18
+UC      = 8.567678E-11   VSAT    = 2E5            A0      = 1.999067
+AGS     = 0.389467       B0      = 2.419633E-6    B1      = 5E-6
+KETA    = -6.020293E-3   A1      = 4.394989E-5    A2      = 0.6320223
+RDSW    = 4E3            PRWG    = -0.2146377     PRWB    = 0.1688991
+WR      = 1              WINT    = 1.569174E-7    LINT    = 0
+DWG     = -2.578547E-8   DWB     = 9.89001E-9     VOFF    = -0.1219424
+NFACTOR = 1.8063821      CIT     = 0              CDSC    = 2.4E-4
+CDSCD   = 0              CDSCB   = 0              ETA0    = 0.0518465
+ETAB    = 4.735705E-3    DSUB    = 0.4254421      PCLM    = 2.7235598
+PDIBLC1 = 0              PDIBLC2 = 4.344554E-3    PDIBLCB = 4.528856E-3
+DROUT   = 5.604876E-3    PSCBE1  = 8E10           PSCBE2  = 5.04016E-10
+PVAG    = 4.6592572      DELTA   = 0.01           RSH     = 2.8
+MOBMOD  = 1              PRT     = 0              UTE     = -1.5
+KT1     = -0.11          KT1L    = 0              KT2     = 0.022
+UA1     = 4.31E-9        UB1     = -7.61E-18      UC1     = -5.6E-11
+AT      = 3.3E4          WL      = 0              WLN     = 1
+WW      = 0              WWN     = 1              WWL     = 0
+LL      = 0              LLN     = 1              LW      = 0
+LWN     = 1              LWL     = 0              CAPMOD  = 2
+XPART   = 0.5            CGDO    = 3.12E-10       CGSO    = 3.12E-10
+CGBO    = 1E-12          CJ      = 9.916255E-4    PB      = 0.8896731
+MJ      = 0.392439       CJSW    = 2.91776E-10    PBSW    = 0.99
+MJSW    = 0.1676363      CJSWG   = 4.42E-11       PBSWG   = 0.99
+MJSWG   = 0.1676363      CF      = 0              PVTH0   = 0.0107102
+PRDSW   = -233.4720278   PK2     = 1.861393E-3    WKETA   = -6.345721E-3
+LKETA   = -0.0207051      )