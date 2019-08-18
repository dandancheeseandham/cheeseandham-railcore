;File     : TrueLevel Then Probe.g
;Effect   : Homes, performs 3 bed-levelling routines and homes again.
;Use-case : Time-saving macro, in order to get the bed as level as possible and then measured to check rail alignment.

M561     ; Clear bed transforms
; Leadscrew locations
; the next two settings are the initial probe height the smaller the faster, but it cannot correct larger deviations so be careful.

M671 S7.5                 ; custom M671 setting for leadscrew adjustment - S is the max correction in mm
M558 H7.5                 ; match your M561 setting (normally 7.5mm)
G28                       ; my G28 is optimised so it does not raise and lower the nozzle between homing X,Y then Z.

; 1) Home Z - Large offset fast
M558 T18000             ; Probing speed 18000
G90 G1 X150 Y150 F18000 ; Move to the center of the bed
M558 F500               ; Fast probe setting (F500 speed)
G30                     ; Probe single Z (at current location)

; 2) Second Home Z - Small offset slow
M558 H3                 ; change dive height for second dive 
M558 F150               ; Medium probe setting (speed)
G30                     ; Probe single Z (at current location)

M558 H30                 ; change dive height for second dive 
; (3) Level bed - Larger offset in case bed is off by more than M671 value
G30 P0 X10 Y30 Z-99999   ; This is bed.g without the Z moves
G30 P1 X10 Y275 Z-99999
G30 P2 X270 Y150 Z-99999 S3

; Z has now been triggered and the bed should be roughly level, now we can drop the probe height safely to a small level for faster probing.

;Home Z (3) Small probe height, medium fast travel.
M558 H1                 ; Make probe height very small , twice your typical probe trigger height should be ok.
M558 T15000             ; Travel speed 15000
G90 G1 X150 Y150 F15000 ; Move to the center of the bed with tiny Z
M558 F50                ; Slow probe setting (accuracy)
G30                     ; Probe single Z

;Level Bed 2
;G1 X10 Y-5 ; move to first print point with Z matching changed M558 value (with probe offset included, mine is 35 so Y gets 35 removed)
;don't forget to move according to your probe offset. mine is Y35 so I deduct that from my G1 moves.
G30 P0 X10 Y30 Z-99999   ;bed.g without Z moves
G30 P1 X10 Y275 Z-99999
G30 P2 X270 Y150 Z-99999 S3

;home bed 3
M558 T12000
G90 G1 X150 Y150 F12000 ; Move to the center of the bed with tiny Z
G30                     ; Probe single Z

;level bed 3
;G1 X10 Y-5 ; move to first print point with Z matching changed M558 value (with probe offset included, mine is 35 so Y gets 35 removed)
;don't forget to move according to your probe offset. mine is Y35 so I deduct that from my G1 moves.
G30 P0 X10 Y30 Z-99999   ;bed.g without Z moves
G30 P1 X10 Y275 Z-99999
G30 P2 X270 Y150 Z-99999 S3

G29         ; Probe the bed 


;Put things back to sensible defaults - match your config-user.g if possible
M671 S7.5                ; back to standard M671 setting for leadscrew adjustment - S is the max correction in mm
M558 H7.5                ; match your M561 setting or above (normally 7.5mm) 
M558 T3000               ; Probe speed in mm/min
M561        ; Clear bed transforms - stop mesh compensation being used during normal operation