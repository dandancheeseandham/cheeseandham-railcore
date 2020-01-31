; pause.g
; called when a print from SD card is paused using M25 or M226
;
M83           ; relative extruder moves
G1 E-6 F3600  ; retract 6mm of filament
T-1           ; deselect all tools and run any tool change macro file (this enables fan to be switched on and off)
M98 P"/sys/move/park.g"

