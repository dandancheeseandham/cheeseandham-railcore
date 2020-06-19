M400                    ; Wait for current moves to finish
M913 X100 Y100          ; Motor currents normal
M204 T3000              ; Set travel acceleration
M203 X24000 Y24000      ; Set maximum feedrate
M558 T15000             ; Set Z probe Travel speed