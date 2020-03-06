; **** Set H and Z to a dive height that you are comfortable with. ****

M671 S2.5                ; Custom M671 setting for leadscrew adjustment - S is the max correction in mm
M558 H1                  ; Set to twice your typical probe height for safety, but you can set this down to 1mm for super-fast probing.
                         ; the firmware moves the Z probe to this height above where it expects the bed to be before commencing probing. The maximum depth of probing 
                         ; from this position is twice the dive height. A small dive height will make probing faster, because the Z probe has 
                         ; less distance to travel before reaching the bed
G90 G1 Z1.5              ; As this script should only be called after an initial bed level, we can bring Z to same as M558 for first quick probe.