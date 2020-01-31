; Home X
M561 ; clear any existing bed transform
M98 P"/sys/probe/height_set_standard.g"
M98 P"/sys/speed/xy_fast.g"
M98 P"/sys/speed/z_fast.g"

M98 P"/sys/move/bed_down.g"       ; lift z so we don't crash. may as well match M561 & M558 probe height 
M98 P"/sys/probe/x.g"
M98 P"/sys/move/backoff_x.g"
M98 P"/sys/move/centre.g"
