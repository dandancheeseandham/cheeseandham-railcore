;File     : bed.g
;Effect   : Performs bed-tramming routine
;Use-case : To tram the bed as level as possible 

M561 ; clear any existing bed transform
M98 P"/sys/probe/bed-4point.g"
M98 P"/sys/move/park.g"
