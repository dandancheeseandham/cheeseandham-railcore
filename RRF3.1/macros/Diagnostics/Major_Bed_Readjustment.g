;File     : Major bed adjustment (30mm)
;Effect   : Increases probe height and leadscrew adjustment maximum before homing and leveling (then returns values to standard config.g values)
;Use-case : When the bed needs major readjustment, and you know the current angle of the bed is compatible with your hotend/fan/probe setup. Allows an offset of 30mm 
;           compared to the standard 7.5mm.

M561                     ; Clear bed transforms

M98 P"/sys/speed/z_fast.g" 
G91 
G1 Z30 F99999 H2 ; lower z
G90

; Home twice
M98 P"/sys/probe/y.g"
M98 P"/sys/probe/y.g"
M98 P"/sys/probe/x.g"
M98 P"/sys/probe/x.g"

M98 P"/sys/probe/height_set_large.g"
M98 P"/sys/move/centre.g" ; Move to the center of the bed
M98 P"/sys/probe/z_rough.g"
M561 ; clear any existing bed transform
G30 P0 X125 Y125 Z-99999
G30 P1 X175 Y125 Z-99999
G30 P2 X150 Y150 Z-99999 S3 

;Put things back to sensible defaults 
M561                     ; Clear bed transforms - stop mesh compensation being used during normal operation
M98 P"/sys/probe/height_set_standard.g"
M98 P"/sys/move/centre.g"



