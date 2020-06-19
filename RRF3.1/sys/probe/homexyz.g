;File     : homexyz.g
;Effect   : Homes all axes and nothing else (no lowering of bed etc)
;Use-case : Part of G28

M98 P"/sys/speed/resetxyz.g"

;G91
M98 P"/sys/speed/xy_slow.g" 
;G1 H1 X-330 Y-330 F99999       
;M98 P"/sys/speed/xy_fast.g"
;G1 H1 X20 Y20 F99999     ; back off 
;G90

M98 P"/sys/probe/x.g"
M98 P"/sys/probe/y.g"
M98 P"/sys/move/z_probe_point.g"
M98 P"/sys/probe/z_rough.g"




