; M558  Fxxx sets the probing speed.

; Probe again slowly for precision
M98 P"/sys/speed/z_slow.g"
G30
M98 P"/sys/speed/z_fast.g"