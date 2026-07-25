# Common Source (CS) Amplifier Design & Layout


This repository contains the design, simulation, and physical layout of a Common Source (CS) Amplifier, developed using the open-source SkyWater 130nm PDK.

---

## Project Overview

This project involved extensive troubleshooting, iterative simulation, and layout optimization to help me go from theoretical hand-calculations to physical silicon realities.

All design and verification work was completed using the **IIC-OSIC-TOOLS** open-source toolchain container, utilizing:

* <u>**Xschem:**</u> Schematic capture
* <u>**Ngspice:**</u> Circuit simulation and analysis
* <u>**KLayout:**</u> Physical mask layout, as well as DRC and LVS physical verification

---

## Target Specifications & Theoretical Calculations

The initial theoretical targets for this amplifier were calculated to meet the following rigorous parameters:

* <u>**DC Gain:**</u> >= 40 dB (>= 100 V/V)
* <u>**Load Capacitance (CL):**</u> 7 pF
* <u>**Unity Gain Bandwidth (fu):**</u> 80 MHz
* <u>**Output Voltage Swing:**</u> 0.2 V to 1.6 V

Based on the standard 1.8V Sky130 transistor parameters extracted for this design (NMOS u = 301.97 cm^2/Vs, PMOS u= 24.42 cm^2/Vs, and an oxide thickness t_ox approx 4.15 nm), hand calculations dictated an initial bias current target of I_bias approx 326.55 uA and a target output resistance of R_o approx 28.42 kOhm to establish the foundational Aspect Ratios (W/L).

---

## Troubleshooting & Final Tuned Values (DC & AC)

Theoretical square-law equations only provide a starting point in the 130nm process due to short-channel effects and massive parasitic capacitances associated with large transistor widths. Extensive troubleshooting, parameter sweeping, and operating point (`.op`) tuning were required to keep all transistors in the saturation region while pushing the bandwidth against the heavy 7 pF load.

### Final Transistor Sizing

* <u>**PMOS (Active Load, `pfet_01v8`):**</u> W = 818.923 um, L = 1 um (Implemented as nf = 10 fingers)
* <u>**NMOS (Driver, `nfet_01v8`):**</u> W = 69.985 um, L = 1 um (Implemented as nf = 5 fingers)

### Final Simulated Performance

* <u>**DC Gain:**</u> 40.62 dB
* <u>**Bandwidth:**</u> 70.90 MHz
* <u>**Bias Current / Operation Point:**</u> I_bias approx 326.56 uA at V_op = 0.767 V

*(Note: Because of extensive layout and schematic tuning, the DC Gain successfully reached the 40dB target. The bandwidth fell slightly short of the 80MHz theoretical maximum due to heavy parasitic loading inherent to the large multi-finger transistor widths required).*

---

## Transient Analysis

### Overview

Following the AC analysis—which demonstrated ~40 dB of gain and a 70.9 MHz bandwidth driving a heavy 7 pF load—the next step was to verify the time-domain behavior using a transient simulation. The goal was to observe the amplifier's real-world response to a small-signal sine wave and verify its steady-state DC equilibrium.

### Test Setup

To keep the NMOS perfectly biased on its operational cliff, the input sine wave was centered exactly at the DC Q-point derived from previous sweeps. A 5 MHz test frequency was chosen to fall well within the amplifier's 70.9 MHz bandwidth.

Input Source Configuration:
- VO = 0.767V (Q-point), VA = 1mV (Small signal), Freq = 5MHz Vin in 0 dc 0.767 ac 1 sin(0.767 1m 5Meg)

Simulation Commands (.control block): .control save all
-Run transient analysis: 1ns step size, 5us total duration tran 1n 5u
-Plot input vs. output plot v(input) v(output) .endc

## Results and Observations
1) Initial Settling Time (RC Drift) During the first microsecond of the simulation, the output voltage slowly drifted upward before stabilizing. This is a normal physical response caused by the massive 7 pF load capacitor charging up to its final DC steady-state. Because the amplifier relies on a high output resistance (R_out) to achieve its 40 dB gain, the resulting RC time constant requires a few microseconds for the output node to fully charge.
2)Phase Inversion As expected for a standard Common Source topology, the output waveform is 180 degrees out of phase with the input waveform. When the input throttle increases, the NMOS pulls the output node down.
3)The DC Equilibrium (Input vs. Output Q-Points) Looking at the steady-state waveforms, the input and output signals center around different DC voltages:
-Input DC Baseline: ~0.767 V (Forced by the input voltage source).
-Output DC Baseline: ~779 mV (Floating).
