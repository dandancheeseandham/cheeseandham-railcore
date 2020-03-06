; homeall if needed.
; If the printer hasn't been homed, home it
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  echo "You need to home and level, performing operation."
  M561 ; clear any existing bed transform
  M98 P"/sys/probe/homexyz.g"
  M98 P"/sys/probe/bed-3point.g" 
  ; Pass 2 on Z
  M98 P"/sys/move/z_probe_point.g"
  M98 P"/sys/probe/height_set_small.g"
  M98 P"/sys/probe/z_accurate.g"
  