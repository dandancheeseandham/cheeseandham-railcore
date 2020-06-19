M400                    ; Wait for current moves to finish
M913 X30 Y30            ; Reduce motor current to prevent belts slipping if sensorless
M204 T200               ; Reduce acceleration on X/Y: stops false triggers if sensorless
M203 X4000 Y4000        ; Set maximum feedrate
M558 T4000              ; Set Z probe Travel speed