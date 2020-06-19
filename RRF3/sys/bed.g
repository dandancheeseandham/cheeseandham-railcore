;File     : bed.g
;Effect   : Performs bed-tramming routine
;Use-case : To tram the bed as level as possible 

M561 ; clear any existing bed transform
M98 P"/sys/probe/height_set_standard.g"
M98 P"/sys/speed/xy_fast.g"
M98 P"/sys/speed/z_fast.g"
M98 P"/sys/move/bed_down.g"
          
M98 P"/sys/probe/bed-4point.g"

M98 P"/sys/move/park.g"