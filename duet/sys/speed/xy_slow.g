M400                    ; Wait for current moves to finish
M913 X50 Y50            ; Reduce motor current to 40% (prevent belts slipping if sensorless)
M204 T300               ; Reduce acceleration on X/Y (stops false triggers if sensorless)
M203 X6000 Y6000        ; Set maximum feedrate
M558 T6000              ; Set Z probe Travel speed