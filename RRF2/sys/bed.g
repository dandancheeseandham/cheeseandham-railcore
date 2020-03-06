;File     : bed.g
;Effect   : Performs bed-tramming routin
;Use-case : To tram the bed as level as possible 
          
M561                     ; Clear bed transforms- stop mesh compensation being used during this operation
M98 P"/sys/probe/bed-3point.g"
M98 P"/sys/move/park.g"