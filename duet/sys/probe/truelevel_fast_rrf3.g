M561                                    ; Clear bed transforms- stop mesh compensation being used during this operation
M98 P"/sys/probe/height_set_standard.g"
M98 P"/sys/speed/xy_fast.g"
M98 P"/sys/speed/z_fast.g"

; If the printer hasn't been homed, home it
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  echo "You need to home and level, performing operation."
  ;Probe Y then X
  M98 P"/sys/probe/y.g"
  M98 P"/sys/move/backoff_y.g"
  M98 P"/sys/probe/x.g"
  ; Pass 1 - quick and rough on Z and 3 point level.
  M98 P"/sys/move/z_probe_point.g"
  M98 P"/sys/probe/z_rough.g"
  M98 P"/sys/probe/bed-3point.g" 
  ; Pass 2 on Z
  M98 P"/sys/move/z_probe_point.g"
  M98 P"/sys/probe/height_set_small.g"
  M98 P"/sys/probe/z_accurate.g"
  

if move.initialDeviation.deviation == 0  || move.initialDeviation.mean == 0  || move.calibrationDeviation.deviation == 0  || move.calibrationDeviation.mean == 0
  echo "Levelling - with three 0's deviation it is likely that machines is homed but not levelled after a reset."
  M98 P"/sys/move/z_probe_point.g"
  M98 P"/sys/probe/z_rough.g"
  M98 P"/sys/probe/bed-3point.g"
  M98 P"/sys/probe/height_set_small.g"
  M98 P"/sys/probe/z_accurate.g"      

while true
  if iterations = 5
    abort "Too many auto calibration attempts"
  if move.initialDeviation.deviation < 0.01 
    if move.calibrationDeviation.deviation < move.initialDeviation.deviation + 0.005
      if move.calibrationDeviation.deviation > move.initialDeviation.deviation - 0.005
        break
  echo "Repeating calibration because initial deviation (" ^ move.initialDeviation.deviation ^ "mm) must be < 0.01"
  echo "and (" ^ move.calibrationDeviation.deviation ^ "mm) must be within 0.005 of initialDeviation"
  M98 P"/sys/probe/Z_then_bedlevel.g"

echo "Auto calibration successful, deviation", move.calibrationDeviation.deviation ^ "mm"
echo "Auto calibration successful, initialDeviation", move.initialDeviation.deviation ^ "mm"  
