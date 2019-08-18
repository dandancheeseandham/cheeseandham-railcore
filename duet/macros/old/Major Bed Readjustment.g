;File     : major bed adjustment, up to 30mm
;Effect   : 
;Use-case : 
M561     ; Clear bed transforms

M671 S30                 ; custom M671 setting for leadscrew adjustment - S is the max correction in mm
M558 H30 T18000 F500 A1     ; match H to your M671 S setting (normally 7.5mm)
G91 G1 Z30 F800 S2       ; lift z so we don't crash. match your M561 setting - normally 7.5mm

; **********
;G28                      ; home XYZ
;G32                      ; Level Bed with 30mm dive height


; Home Y & X START
;Change currents for sensorless homing
M400                    ; make sure everything has stopped before we make changes
M913 X40 Y40            ; reduce motor current to 40% to prevent belts slipping
M201 X300 Y300          ; reduce acceleration on X/Y to stop false triggers

; home Y - I home Y first to ensure hotend fan doesn't hit left side Z extrusions.
G1 Y-330 F4000 S1       ; move to home position

; home X
; Put currents back for moving to best location for homing X
M400                    ; make sure everything has stopped before we make changes
M913 X100 Y100          ; motor currents back to normal
M201 X3000 Y3000        ; accel back to original

G91 G1 Y120 F18000      ; back off to edge of bed to measure X

;Change currents for sensorless homing
M400                    ; make sure everything has stopped before we make changes
M913 X40 Y40            ; reduce motor current to 40% to prevent belts slipping
M201 X300 Y300          ; reduce acceleration on X/Y to stop false triggers

G91 G1 S1 X-330 F4000   ; move to home position

; Put currents back 
M400                    ; make sure everything has stopped before we make changes
M913 X100 Y100          ; motor currents back to normal
M201 X3000 Y3000        ; accel back to original

; Home Y & X END


;Home Z (1) Large offset
M558 T18000
G90 G1 X150 Y150 F18000 ; Move to the center of the bed
M558 F500               ; Fast probe setting (speed)
G30                     ; Probe single Z

; Level bed (1) Larger offset in case bed is off by more than M671 value
G1 X10 Y-5 Z3; move to first print point with z matching M671 value - Don't forget to move to XY location according to your probe offset. mine is Y35 so I deduct 35 from my G1 Y move.
G30 P0 X10 Y30 Z-99999   ;bed.g without Z moves
G30 P1 X10 Y275 Z-99999
G30 P2 X270 Y150 Z-99999 S3

; Z has now been triggered and the bed should be roughly level, now we can drop the probe height safely to a small level for faster probing.


; ******

;Put things back to sensible defaults - match your config-user.g if possible
M671 S7.5                ; back to standard M671 config.g setting for leadscrew adjustment - S is the max correction in mm
M558 H7.5                ; match your stand M558 config.g setting or above (normally 10mm) 
M558 T6000 F50           ; match your original config.g setting T Probe travel speed in mm/min. F probe Z drop speed
M561                     ; Clear bed transforms - stop mesh compensation being used during normal operation
G1 X150 Y150 F18000      ; move to centre



