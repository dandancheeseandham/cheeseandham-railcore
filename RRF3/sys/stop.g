; stop.g
; run when a print finishes normally with an M0 command at the end of the print job.
;

G91 G1 E-6 F3600         ; retract 6mm of filament
M98 P"/sys/move/park.g"  ; Move Y-carriage for part removal
M400                     ; wait for moves to complete

T0                      ; select T0
M140 S0 R0              ; clear temperatures from DWC
M140 S-273.1 R0 	    ; Standby and initial Temp for bed as "off" (-273 = "off")
G10 P0 S-273.1 R-273.1  ; Set tool 0 operating and standby temperatures(-273 = "off")
T-1	                    ; Deselect all tools	

M106 P2 S0               ; cooling fan off
;M106 P3 S1.0            ; enclosure fan on
M84 E0:1                 ; extruders off

