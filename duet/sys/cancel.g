; cancel.g
; run when a print is cancelled with an M1 command during a print job.
;

G91 G1 E-6.0 F3600.0 ;  retract
M98 P"/sys/move/park.g"
M400                    ; wait for moves to complete

M106 P2 S0               ; cooling fan off
M84 E0:1                 ; extruders off