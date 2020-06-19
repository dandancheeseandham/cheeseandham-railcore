;File     : Major bed adjustment (30mm)
;Effect   : Increases probe height and leadscrew adjustment maximum before homing and leveling (then returns values to standard config.g values)
;Use-case : When the bed needs major readjustment, and you know the current angle of the bed is compatible with your hotend/fan/probe setup. Allows an offset of 30mm 
;           compared to the standard 7.5mm.

M561                     ; Clear bed transforms
G91 
G1 Z30 F99999 H2 ; lower z
G90

G28 XY

M671 S15                 ; Custom M671 setting for leadscrew adjustment - S is the max correction in mm
M558 H15                 ; Set to twice your typical probe height for safety, but you can set this down to 1mm for super-fast probing.
                         ; the firmware moves the Z probe to this height above where it expects the bed to be before commencing probing. The maximum depth of probing 
                         ; from this position is twice the dive height. A small dive height will make probing faster, because the Z probe has 
                         ; less distance to travel before reaching the bed
G91 
G1 Z30 H2                ; As this script is for large bed levels, we raise Z to same as M558 for a safe probe.
G90


G1 X150 Y150             ; roughly centre of bed
G28 Z

G30 P0 X125 Y125 Z-99999
G30 P1 X175 Y125 Z-99999
G30 P2 X150 Y150 Z-99999 S3 

;Put things back to sensible defaults 
M671 S7.5
M558 H7.5


