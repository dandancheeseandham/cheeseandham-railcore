G10 S240 R160 ; Heat up the current tool to 240C enough for PETG
M140 S45 R30
M207 S1.8 F4800 Z0.18        ; Firmware Retraction 0.18mm , speed 80m/s , Z-hop 0.18
M572 D0 S0.05                ; Pressure advance compensation (if needed to be changed)
M291 P"PETG config loaded" R"Filament macro" S1 T1 ; Display message
;M117 ""