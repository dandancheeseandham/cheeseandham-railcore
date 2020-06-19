;File     : homeall.g
;Effect   : Homes all axes
;Use-case : G28

M561 ; clear any existing bed transform
M98 P"/sys/move/bed_down.g"

;Homeall with fast Z probe
M98 P"/sys/probe/homexyz.g"

;2nd Accurate Z probe
M98 P"/sys/probe/height_set_small.g"
M98 P"/sys/probe/z_accurate.g"

;Finish
M98 P"/sys/probe/height_set_standard.g"
M98 P"/sys/move/park.g"



