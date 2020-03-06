M561                                    ; Clear bed transforms- stop mesh compensation being used during this operation
M98 P"/sys/probe/height_set_standard.g"
M98 P"/sys/speed/xy_fast.g"
M98 P"/sys/speed/z_fast.g"
M98 P"/sys/probe/homeall_if_needed.g"  

if move.calibration.initial.deviation == 0  || move.calibration.initial.mean == 0  || move.calibration.final.deviation == 0  || move.calibration.final.mean == 0
  echo "Levelling - with three 0's deviation it is likely that machines is homed, but not levelled after a software reset."
  M98 P"/sys/move/z_probe_point.g"
  M98 P"/sys/probe/z_rough.g"
  M98 P"/sys/probe/bed-3point.g"
  M98 P"/sys/probe/height_set_small.g"
  M98 P"/sys/probe/z_accurate.g"      

while true
  if iterations = 5
    abort "Too many auto calibration attempts"
  if move.calibration.initial.deviation < 0.01 
    if move.calibration.final.deviation < move.calibration.initial.deviation + 0.005
      if move.calibration.final.deviation > move.calibration.initial.deviation - 0.005
        break
  echo "Repeating calibration because initial deviation (" ^ move.calibration.initial.deviation ^ "mm) must be < 0.01"
  echo "and (" ^ move.calibration.final.deviation ^ "mm) must be within 0.005 of initialDeviation"
  M98 P"/sys/probe/bedlevel_then_Z.g"

echo "Auto calibration successful, deviation", move.calibration.final.deviation ^ "mm"
echo "Auto calibration successful, initialDeviation", move.calibration.initial.deviation ^ "mm"  
