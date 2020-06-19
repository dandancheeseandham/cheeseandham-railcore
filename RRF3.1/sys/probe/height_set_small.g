; **** Set H and Z to a dive height that you are comfortable with. ****
M671 S2.5                ; Custom M671 setting for leadscrew adjustment - S is the max correction in mm
M558 H2.5                ; Set to twice your typical probe height for safety, but you can set this down to 1mm for super-fast probing.
                         ; the firmware moves the Z probe to this height above where it expects the bed to be before commencing probing. The maximum depth of probing 
                         ; from this position is twice the dive height. A small dive height will make probing faster, because the Z probe has 
                         ; less distance to travel before reaching the bed
G90 
G1 Z2.5              ; As this script should only be called after an initial bed level, we can bring Z to same as M558 for first quick probe.

;The "dive height" H parameter on M558 is not limited by the modest height the BL-Touch requires, but by the time it takes for the pin to release & drop.  I can run 2mm just fine, but it's cutting it close on time.
;3mm seems safer, and 5 is the default

