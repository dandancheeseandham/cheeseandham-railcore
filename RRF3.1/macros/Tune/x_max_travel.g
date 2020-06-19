; Homeall
M18 ; disable all motors ready to rehome.

M561 ; clear any existing bed transform
M98 P"/sys/probe/height_set_standard.g"
M98 P"/sys/speed/xy_fast.g"
M98 P"/sys/speed/z_fast.g"

M98 P"/sys/move/bed_down.g"

;Homeall with fast Z probe
M98 P"/sys/probe/homexyz.g"

;2nd Accurate Z probe
M98 P"/sys/probe/height_set_small.g"
M98 P"/sys/probe/z_accurate.g"

;Finish
M98 P"/sys/probe/height_set_standard.g"
M98 P"/sys/move/centre.g"

M98 P"/sys/speed/xy_slow.g" 
G91 G1 H3 X330 F99999       
M98 P"/sys/speed/xy_fast.g"


M500
M999



