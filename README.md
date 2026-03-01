# RLC Circuit Transient Simulation – MATLAB

## Overview
This project models and simulates the transient response of an RLC circuit under step input conditions using MATLAB's transfer function approach.

## Implementation Summary
- Defined R, L, C circuit parameters
- Modeled current transfer function: I(s)/V(s) = 1 / (L s² + R s + 1/C)
- Generated step response using `tf` and `step`
- Computed component voltages:
  - Resistor: V_R = R · i(t)
  - Inductor: V_L = L · di/dt (using `gradient`)
  - Capacitor: V_C = (1/C) ∫ i(t) dt (using `cumtrapz`)
- Evaluated system stability by varying resistance values (R = 2, 10, 50 Ω)
- Compared damping behavior through step response plots

## Concepts Demonstrated
- Second-order system modeling
- Transfer function representation
- Transient response analysis
- Numerical differentiation and integration
- Damping behavior and stability analysis
- Parameter sensitivity evaluation

## Outcome
Successfully demonstrated how resistance affects damping characteristics and transient stability in an RLC system, including underdamped and overdamped behavior.
