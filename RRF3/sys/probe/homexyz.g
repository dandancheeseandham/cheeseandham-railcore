;File     : homexyz.g
;Effect   : Homes all axes and nothing else (no lowering of bed etc)
;Use-case : Part of G28

M98 P"/sys/probe/x.g"
M98 P"/sys/probe/y.g"
M98 P"/sys/move/z_probe_point.g"
M98 P"/sys/probe/z_rough.g"

