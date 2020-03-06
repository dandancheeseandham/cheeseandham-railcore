;File     : Quickstart.g
;Effect   : Assumes machine is on and already been truelevelled, (does a home and single 3 bed level just to be sure) as well as set initial temperatures to save on warm up time.
;Use-case : Time-saving macro, in order to get printing as soon as possible 
          
M561                     ; Clear bed transforms- stop mesh compensation being used during this operation

M98 P"/sys/probe/height_set_standard.g"
M98 P"/sys/move/z_up.g"
M98 P"/sys/probe/y.g"
M98 P"/sys/move/backoff_y.g"
M98 P"/sys/probe/x.g"

; Pass 1 - quick and rough
M98 P"/sys/move/z_probe_point.g"
M98 P"/sys/probe/z_rough.g"

; Pass 2
M98 P"/sys/move/z_probe_point.g"
M98 P"/sys/probe/height_set_small.g"
M98 P"/sys/probe/z_accurate.g"
M98 P"/sys/probe/bed-3point.g" 

; Finish
;M98 P"/sys/probe/height_set_standard.g" 
;M98 P"/sys/move/centre.g"