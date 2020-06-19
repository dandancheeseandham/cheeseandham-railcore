; Axis and motor configuration
M201 X1500 Y1500 Z10 E500      ; Accelerations (mm/s^2)
M203 X12000 Y12000 Z450 E1800   ; Maximum speeds (mm/min)
M566 X500 Y500 Z15 E10        ; Maximum jerk speeds mm/minute

; Heater model

; heater tuned not needed - M307 H0 A270.7 C90.4 D6.7 B0 S1.0

M558 P1 X0 Y0 Z1 H5 F50 T6000 A5 S0.01	; Z probe is an IR probe and is not used for homing any axes
                                        ; Set Z probe type to unmodulated (P1). Dive height (H5). Speeds 
                                        ; (Probe - F50, travel - T6000). Probe each point maximum 5 times (A5) 
                                        ; in order to reach 0.02mm tolerance (S0.02).
M563 P8 D0 S"Conservative settings ON" 