;File     : TrueLevel.g
;Effect   : Homes, performs bed-levelling routines 
;Use-case : Time-saving macro, in order to get the bed as level as possible 
          
M98 P"/sys/speed/resetxyz.g"
M98 P"/sys/move/bed_down.g"
M98 P"/sys/probe/homexyz.g"
M98 P"/sys/probe/bedlevel_then_Z.g"
M98 P"/sys/probe/bedlevel_then_Z.g"
M98 P"/sys/probe/bedlevel_then_Z.g"

; Finish
M98 P"/sys/speed/xy_fast.g"
M98 P"/sys/speed/z_fast.g"
