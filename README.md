Common Source (CS) Amplifier Design & Layout

This repository contains the design, simulation, and physical layout of a Common Source (CS) Amplifier, developed using the open-source SkyWater 130nm PDK.

Project Overview

This project involved extensive troubleshooting, iterative simulation, and layout optimization to bridge the gap between theoretical hand-calculations and physical silicon realities.

All design and verification work was completed using the IIC-OSIC-TOOLS open-source toolchain container, utilizing:

Xschem: Schematic capture

Ngspice: Circuit simulation and analysis

KLayout: Physical mask layout, as well as DRC and LVS physical verification

Target Specifications & Theoretical Calculations

The initial theoretical targets for this amplifier were calculated to meet the following rigorous parameters:

DC Gain: $\ge 40\text{ dB}$ ($\ge 100\text{ V/V}$)

Load Capacitance ($C_L$): $7\text{ pF}$

Unity Gain Bandwidth ($f_u$): $80\text{ MHz}$

Output Voltage Swing: $0.2\text{ V}$ to $1.6\text{ V}$

Based on the standard 1.8V Sky130 transistor parameters extracted for this design (NMOS $u_0 = 301.97\text{ cm}^2/\text{V}\cdot\text{s}$, PMOS $u_0 = 24.42\text{ cm}^2/\text{V}\cdot\text{s}$, and an oxide thickness $t_{ox} \approx 4.15\text{ nm}$), hand calculations dictated an initial bias current target of $I_{bias} \approx 326.55\text{ uA}$ and a target output resistance of $R_o \approx 28.42\text{ k}\Omega$ to establish the foundational Aspect Ratios ($W/L$).

Troubleshooting & Final Tuned Values

Theoretical square-law equations only provide a starting point in the 130nm process due to short-channel effects and massive parasitic capacitances associated with large transistor widths.

Extensive troubleshooting, parameter sweeping, and operating point (.op) tuning were required to keep all transistors in the saturation region while pushing the bandwidth against the heavy $7\text{ pF}$ load.

Final Transistor Sizing

PMOS (Active Load, pfet_01v8): $W = 818.923\text{ um}$, $L = 1\text{ um}$ (Implemented as $nf = 10$ fingers, $W_{finger} \approx 81.89\text{ um}$)

NMOS (Driver, nfet_01v8): $W = 69.985\text{ um}$, $L = 1\text{ um}$ (Implemented as $nf = 5$ fingers, $W_{finger} \approx 14.0\text{ um}$)

Final Simulated Performance

DC Gain: $\approx 40.6\text{ dB}$ ($107.15\text{ V/V}$)

Unity Gain Bandwidth: $67.15\text{ MHz}$

Bias Current / Operation Point: $I_{bias} \approx 326.56\text{ uA}$ at $V_{op} = 0.767\text{ V}$

(Note: Thanks to extensive layout and schematic tuning, the DC Gain successfully exceeded the rigorous 40dB target. The bandwidth fell slightly short of the 80MHz theoretical maximum due to heavy parasitic loading inherent to the large multi-finger transistor widths required).

Schematics and Layout

Schematic

![Schematic](images/schematic.png)

Simulation Waveforms

![AC Response](images/image_e4a653.jpg)
![DC Transfer Characteristic](images/image_e4a922.jpg)

Physical Layout

The physical layout was designed to handle the large transistor widths required for the high unity-gain bandwidth. It utilizes a multi-finger transistor approach to reduce parasitic gate resistance, minimize layout area, and prevent design rule violations.

![Physical Layout](images/layout.png)

Verification

DRC (Design Rule Check): Passed (via KLayout)

LVS (Layout vs. Schematic): Passed (via KLayout)
