M558 P1 H5 F120 T6000 A5 S0.03	; Set Z probe type to unmodulated (P1). Dive height (H5). Speeds 
                                ; (Probe - F120, travel - T6000). Probe each point 5 times (A5) maximum
                                ; in order to reach 0.03mm tolerance (S0.03).
M557 X20:280 Y20:280 S260 S40   ; Define mesh grid (X[min x]:[max x] Y[min-y]:[max-y] 
				                ; S[x spacing of mesh grid]:[y spacing of mesh grid])
M561                            ; clear any bed transform
G28                             ; home all axes
G29                             ; Probe the bed at X points