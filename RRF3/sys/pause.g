; pause.g
; called when a print from SD card is paused using M25 or M226
;
M83           ; relative extruder moves
G1 E-6 F3600  ; retract 6mm of filament
M98 P"/sys/move/park.g"
M98 P"/sys/heater/standby.g"  ; tool standby


