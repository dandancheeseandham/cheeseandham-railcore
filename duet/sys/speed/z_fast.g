M400                    ; Wait for current moves to finish
M913 Z60                ; Set Z motor current to 60% for fast moves.
M201 Z20                ; Set travel acceleration
M203 Z900               ; Set maximum feedrate
M558 F900               ; Set Z probe Travel speed 