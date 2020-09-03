; cancel.g
; run when a print is cancelled with an M1 command during a print job.
;

G91
G1 Z5 F900  ; lower z
G90

; parks the head
G1 X{move.axes[0].max-5} Y{move.axes[1].max-5} F24000
if move.axes[2].machinePosition < 60
  G90
  G1 Z60
else
  G91
  G1 Z10 F99999 H2 ; lower z
  G90

T-1                      ; deselect all tools and run any tool change macro file 
M400                     ; wait for moves to complete
M106 S0                  ; cooling fan off
M84 E0:1                 ; extruders off