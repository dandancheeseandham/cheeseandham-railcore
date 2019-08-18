T-1
M106 P0 S0 I-1 F500 H-1 C"Dead"              ; Set fan 0 OFF (Dead fan)
T0
M106 P1 S1 I0 F500 H1 T45 C"Hotend"         ; Set fan 1. Thermostatic control is ON for Heater 1 (Hotend fan)

M106 P2 S1 I0 H-1 C"Part"               ; (Part cooling fan) Set fan 2 value, Thermostatic control is OFF
M563 P0 S"E3Dv6 Gold" D0 H1 F2              ; Define tool 0 uses extruder 0, heater 1 ,Fan 2
