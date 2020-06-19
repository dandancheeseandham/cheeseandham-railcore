M400                    ; Wait for current moves to finish
M913 Z100               ; Set Motor currents to 100% for slow movements and printing.
M201 Z2                 ; Set travel acceleration
M203 Z50                ; Set maximum feedrate
M558 F50                ; Set Z probe Travel speed 