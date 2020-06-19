M400                    ; Wait for current moves to finish
M913 X50 Y50            ; Reduce motor current to 40% (prevent belts slipping if sensorless)
M204 T200               ; Reduce acceleration on X/Y (stops false triggers if sensorless)
M203 X9000 Y9000        ; Set maximum feedrate
M558 T9000              ; Set Z probe Travel speed