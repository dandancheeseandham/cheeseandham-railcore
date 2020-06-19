;File     : TrueLevel_with_Mesh.g
;Effect   : Homes, performs 3 bed-levelling routines and probes the bed for information (mesh comp. disabled afterwards)
;Use-case : Time-saving macro, in order to get the bed as level as possible and then measured to check rail alignment.
          
M98 P"/sys/probe/truelevel_fast_rrf3.g"
M98 P"/sys/probe/height_set_small.g"
M98 P"/sys/speed/z_slow.g"
G29                      ; Probe the bed to get a mesh.

;Clean up
M561                     ; Clear bed transforms - stop mesh compensation being used during normal operation
M98 P"/sys/probe/height_set_standard.g"
M98 P"/sys/speed/xy_fast.g"
M98 P"/sys/speed/z_fast.g"
M98 P"/sys/probe/z_rough.g"

; Finish off
M98 P"/sys/move/park.g"
M98 P"/sys/move/bed_down.g"



