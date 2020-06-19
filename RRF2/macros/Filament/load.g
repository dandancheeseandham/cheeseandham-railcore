;Commented out until tested.
;load PLA
T0
G10 S220 ; Set current tool temperature to 220C
M116 ; Wait for the temperatures to be reached
;G1 E20 F600 ; Feed 30mm of filament at 600mm/min
G1 E80 F3000 ; Feed 380mm of filament at 3000mm/min
G1 E50 F300 ; Feed 25mm of filament at 300mm/min
G4 P1000 ; Wait one second
G1 E-10 F1800 ; Retract 10mm of filament at 1800mm/min
M400 ; Wait for moves to complete
M84 E0:1 ; Turn off extruder drives 1 and 2