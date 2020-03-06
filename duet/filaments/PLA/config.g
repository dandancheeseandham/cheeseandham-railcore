;PLA config.g
G10 S190 R80 ; Heat up the current tool to 190C enough for PLA
M207 S1.8 F4800 Z0.18        ; Firmware Retraction 0.18mm , speed 80m/s , Z-hop 0.18
M572 D0 S0.05                ; Pressure advance compensation (if needed to be changed)
M117 "PLA config loaded"