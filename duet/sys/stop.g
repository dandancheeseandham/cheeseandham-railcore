; stop.g
; run when a print finishes normally with an M0 command at the end of the print job.
;

G91 G1 E-1.0 F1000.0 ;  retract
M98 P"/sys/move/park.g"
M400                    ; wait for moves to complete

M140 S-273               ; turn off bed
M106 P2 S0                  ; cooling fan off
;M106 P3 S1.0            ; enclosure fan on
M84 E0:1                 ; extruders off

G10 P0 R-273.15 S-273.15 ; Turn off tool heaters
T-1                      ; deactivate current tool
