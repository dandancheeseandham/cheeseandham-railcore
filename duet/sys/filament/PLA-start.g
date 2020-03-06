;; Macro to be called at the start of a print for PLA

M207 S1.8 F4800 Z0.18  ; Firmware Retraction 1.8mm , speed 80m/s , Z-hop 0.18
M190 S35 ; Set and wait for bed temp to rise
M98 P"/sys/probe/truelevel_fast.g"   ; Personal TrueLevel - homes and 4*bed tramming within 1.5 mins
M104 S195 T0 ; Raise hot-end temp to profile requested hot-end layer 1 temp
M109 S195 T0 ; Wait for hot-end temp to rise to profile requested hot-end layer 1 temp