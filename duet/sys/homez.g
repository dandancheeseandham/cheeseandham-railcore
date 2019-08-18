;File     : homez.g
;Effect   : does a 2-stage Z-homing. Once quickly to bring the bed up from a long distance quickly, then again slower for better accuracy.
;Use-case : the machine may be Z-homed from any position at a reasonable pace, without resorting to dangerous options such as M564 H0 - while still retaining accuracy of the final probe.

M98 P"/sys/move/z_up.g"
M98 P"/sys/move/z_probe_point.g"
M98 P"/sys/probe/z_rough.g"
M98 P"/sys/probe/height_set_small.g"
M98 P"/sys/probe/z_accurate.g"
M98 P"/sys/probe/height_set_standard.g"
M98 P"/sys/move/centre.g" 
