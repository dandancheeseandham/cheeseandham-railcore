;File     : TrueLevel.g
;Effect   : Homes, performs bed-levelling routines 
;Use-case : Time-saving macro, in order to get the bed as level as possible 
          
M561                     ; Clear bed transforms- stop mesh compensation being used during this operation

M98 P"/sys/probe/height_set_standard.g"
M98 P"/sys/move/z_up.g"
M98 P"/sys/probe/y.g"
M98 P"/sys/move/backoff_y.g"
M98 P"/sys/probe/x.g"

; Pass 1 - quick and rough
M98 P"/sys/move/z_probe_point.g"
M98 P"/sys/probe/z_rough.g"
M98 P"/sys/probe/bed-3point.g" 

; Pass 2
M98 P"/sys/move/z_probe_point.g"
M98 P"/sys/probe/height_set_small.g"
M98 P"/sys/probe/z_accurate.g"
M98 P"/sys/probe/bed-4point.g" 

; Pass 3
M98 P"/sys/move/z_probe_point.g"
M98 P"/sys/probe/z_accurate.g"
M98 P"/sys/probe/bed-4point.g" 

; Pass 4
M98 P"/sys/move/z_probe_point.g"
M98 P"/sys/probe/z_accurate.g"
M98 P"/sys/probe/bed-4point.g" 

; Finish
;M98 P"/sys/probe/height_set_standard.g" 
;M98 P"/sys/move/centre.g"
