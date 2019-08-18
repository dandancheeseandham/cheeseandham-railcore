; M558  Fxxx sets the probing speed.
; Probe rapidly to get us in the right ballpark.
; This brings the bed up quickly but may be less accurate.

; Probe again slowly for precision
M98 P"/sys/speed/z_slow.g"
G30
M98 P"/sys/speed/z_fast.g"