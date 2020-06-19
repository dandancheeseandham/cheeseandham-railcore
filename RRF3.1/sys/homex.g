;File     : homex.g
;Effect   : Homes X axis
;Use-case : G28 X

M98 P"/sys/move/bed_down.g"       ; lift z so we don't crash. 
M98 P"/sys/probe/x.g"

