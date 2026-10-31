v {xschem version=3.4.8 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {IHP SG13G2 NMOS 1:2 mirror | Iref=10uA | W/L=2u/1u | TT 27C} 20 -350 0 0 0.35 0.35 {}
C {sg13g2_pr/sg13_lv_nmos.sym} 280 -100 0 0 {name=M1 l=1u w=2u ng=1 m=1 mm_ok=0 model=sg13_lv_nmos spiceprefix=X}
N 300 -70 300 0 {}
N 300 -100 340 -100 {}
N 340 -100 340 0 {}
C {devices/gnd.sym} 300 0 0 0 {name=gM1 lab=GND}
C {devices/gnd.sym} 340 0 0 0 {name=bM1 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 580 -100 0 0 {name=M2 l=1u w=2u ng=1 m=1 mm_ok=0 model=sg13_lv_nmos spiceprefix=X}
N 600 -70 600 0 {}
N 600 -100 640 -100 {}
N 640 -100 640 0 {}
C {devices/gnd.sym} 600 0 0 0 {name=gM2 lab=GND}
C {devices/gnd.sym} 640 0 0 0 {name=bM2 lab=GND}
N 300 -130 300 -220 {}
N 140 -220 300 -220 {}
N 140 -220 140 -190 {}
N 140 -130 140 0 {}
C {devices/isource.sym} 140 -160 2 0 {name=Iref value=10u}
C {devices/gnd.sym} 140 0 0 0 {name=gref lab=GND}
N 260 -100 240 -100 {}
N 240 -100 240 -220 {}
N 300 -220 500 -220 {}
N 500 -220 500 -100 {}
N 500 -100 560 -100 {}
C {devices/lab_pin.sym} 300 -220 0 0 {name=lg lab=gate}
N 600 -130 600 -260 {}
N 600 -260 780 -260 {}
N 780 -260 780 -190 {}
N 780 -130 780 0 {}
C {devices/vsource.sym} 780 -160 0 0 {name=Vout value=0}
C {devices/gnd.sym} 780 0 0 0 {name=gout lab=GND}
C {devices/lab_pin.sym} 600 -260 0 0 {name=lo lab=out}
C {devices/code_shown.sym} 20 100 0 0 {name=SIM only_toplevel=true value=".lib /foss/pdks/ihp-sg13g2/libs.tech/ngspice/models/cornerMOSlv.lib mos_tt
.temp 27
.control
set wr_singlescale
set wr_vecnames
set numdgt=15
dc Vout 0 1.2 0.001
let iout = -i(Vout)
wrdata xschem.dat v(out) iout v(gate)
write xschem.raw
quit
.endc
"}

C {sg13g2_pr/sg13_lv_nmos.sym} 1020 -100 0 0 {name=M3 l=1u w=2u ng=1 m=1 mm_ok=0 model=sg13_lv_nmos spiceprefix=X}
N 1040 -70 1040 0 {}
N 1040 -100 1080 -100 {}
N 1080 -100 1080 0 {}
C {devices/gnd.sym} 1040 0 0 0 {name=gM3 lab=GND}
C {devices/gnd.sym} 1080 0 0 0 {name=bM3 lab=GND}
N 1040 -130 1040 -260 {}
C {devices/lab_pin.sym} 1040 -260 0 0 {name=out3 lab=out}
N 980 -100 1000 -100 {}
C {devices/lab_pin.sym} 980 -100 0 0 {name=gate3 lab=gate}
T {M2 and M3: parallel output devices, target 20uA} 500 -330 0 0 0.3 0.3 {}
