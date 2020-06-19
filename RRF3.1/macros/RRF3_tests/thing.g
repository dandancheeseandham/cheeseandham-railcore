M561 ; clear any existing bed transform

T0   ; select T0
M98 P"/sys/heater/standby.g"

M98 P"/sys/move/bed_down.g"
;Homeall with fast Z probe
M98 P"/sys/probe/homexyz.g"

;2nd Accurate Z probe
M98 P"/sys/probe/height_set_small.g"
M98 P"/sys/probe/z_accurate.g"

;Finish
M98 P"/sys/probe/height_set_standard.g"
G90
G1 Z0