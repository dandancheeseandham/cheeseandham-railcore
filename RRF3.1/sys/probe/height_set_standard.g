;File     : height_set_standard.g
;Effect   : standard probe height
;Use-case : Set H and Z to a dive height to standard.

M561                     ; Clear bed transforms- stop mesh compensation being used during this operation
M671 S7.5                ; Back to standard M671 config.g setting for leadscrew adjustment - S is the max correction in mm
M558 H7.5                ; Match your stand M558 config.g setting or above (normally 10mm) 
                         ; the firmware moves the Z probe to this height above where it expects the bed to be before commencing probing. The maximum depth of probing 
                         ; from this position is twice the dive height. A small dive height will make probing faster, because the Z probe has 
                         ; less distance to travel before reaching the bed

