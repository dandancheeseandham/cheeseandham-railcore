;File     : bedlevel_then_Z.g
;Effect   : a bed level pass
;Use-case : levels then probes Z


M98 P"/sys/probe/height_set_small.g"
M98 P"/sys/probe/bed-3point.g"
 
M98 P"/sys/move/z_probe_point.g"
M98 P"/sys/probe/z_accurate.g"
M98 P"/sys/probe/height_set_standard.g"