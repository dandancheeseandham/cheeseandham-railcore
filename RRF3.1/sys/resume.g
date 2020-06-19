; resume.g
; called before a print from SD card is resumed

T0 ; select tool 0
M116 ; wait for temperatures to reach their targets
G1 R1 Z5 F6000 ; go to 5mm above position of the last print move
G1 R1          ; go back to the last print move
M83            ; relative extruder moves
G1 E6 F3600    ; extrude 6mm of filament