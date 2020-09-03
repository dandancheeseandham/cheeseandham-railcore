; homey.g
; called to home the Y axis
;
G91               ; relative positioning
G1 H2 Z5 F900     ; lift Z relative to current position
G1 H1 Y-305 F1800 ; move quickly to Y axis endstop and stop there (first pass)
G1 Y5 F6000       ; go back a few mm
G1 H1 Y-10 F360   ; move slowly to Y axis endstop once more (second pass)
G1 Y15 F6000      ; back off Y
G1 H2 Z-5 F6000   ; lower Z again
G90               ; absolute positioning
