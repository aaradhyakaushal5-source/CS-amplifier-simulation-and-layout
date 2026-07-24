v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -170 0 -50 0 {lab=input}
N -210 60 -170 60 {lab=0}
N -210 60 -210 90 {lab=0}
N -250 -80 -250 0 {lab=#net1}
N -0 -80 0 -40 {lab=#net1}
N -250 -80 -0 -80 {lab=#net1}
N 50 0 100 0 {lab=output}
N -250 60 -210 60 {lab=0}
C {cs.sym} 0 0 0 0 {name=x1}
C {vsource.sym} -250 30 0 0 {name=V1 value=1.8 savecurrent=false}
C {vsource.sym} -170 30 0 0 {name=V2 
value= 0
savecurrent=false" }
C {gnd.sym} -210 90 0 0 {name=l1 lab=0}
C {noconn.sym} 100 0 2 0 {name=l2}
C {code_shown.sym} 150 -220 0 0 {name=COMMANDS 
only_toplevel=true
value="
.control
  save all
  *ac dec 100 1 10G
  *plot db(v(output))
  dc V2 0 1.8 0.01
  plot v(input) v(output)  
.endc
"

  }
C {sky130_fd_pr/corner.sym} -500 -10 0 0 {name=CORNER only_toplevel=false corner=tt}
C {lab_wire.sym} -120 0 0 0 {name=p1 sig_type=std_logic lab=input
value=dc}
C {lab_wire.sym} 90 0 0 0 {name=p2 sig_type=std_logic lab=output}
C {gnd.sym} 0 30 0 0 {name=l3 lab=0}
