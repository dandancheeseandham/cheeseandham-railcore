;ABS config.g
G10 S230 R130 ; Heat up the current tool to 190C enough for ABS
M140 S110 R100
M207 S1.8 F4800 Z0.18        ; Firmware Retraction 0.18mm , speed 80m/s , Z-hop 0.18
M572 D0 S0.05                ; Pressure advance compensation (if needed to be changed)
M117 "ABS config loaded"