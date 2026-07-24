v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 10 160 10 200 {lab=VSS}
N 10 200 90 200 {lab=VSS}
N 160 160 160 200 {lab=VSS}
N 90 200 160 200 {lab=VSS}
N 10 60 10 100 {lab=CURR}
N 160 60 160 100 {lab=VO}
N 50 30 120 30 {lab=CURR}
N 10 80 90 80 {lab=CURR}
N 90 30 90 80 {lab=CURR}
N 110 130 120 130 {lab=VIN}
N 10 -80 10 0 {lab=VDD}
N 10 0 160 0 {lab=VDD}
N 160 80 220 80 {lab=VO}
N -20 30 10 30 {lab=VDD}
N 160 30 180 30 {lab=VDD}
N 180 -10 180 30 {lab=VDD}
N 140 -10 180 -10 {lab=VDD}
N 140 -10 140 -0 {lab=VDD}
N -20 -20 -20 30 {lab=VDD}
N -20 -20 10 -20 {lab=VDD}
N 160 130 180 130 {lab=VSS}
N 180 130 180 180 {lab=VSS}
N 160 180 180 180 {lab=VSS}
C {sky130_fd_pr/nfet_01v8.sym} 140 130 0 0 {name=M1
W=69.985
L=1
nf=5
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 30 30 0 1 {name=M2
W=818.923
L=1
nf=10
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 140 30 0 0 {name=M3
W=818.923
L=1
nf=10
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {ipin.sym} 10 -80 1 0 {name=p1 lab=VDD
}
C {ipin.sym} 110 130 0 0 {name=p2 lab=VIN}
C {opin.sym} 220 80 0 0 {name=p3 lab=VO}
C {iopin.sym} 90 200 1 0 {name=p4 lab=VSS}
C {ipin.sym} 10 100 0 0 {name=p5 lab=CURR}
