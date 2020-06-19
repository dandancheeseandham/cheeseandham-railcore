; cancel.g
; run when a print is cancelled with an M1 command during a print job.
; Script assumes pause has already been run.
;
M106 P2 S0                    ; cooling fan off
M84 E0:1                      ; extruders off