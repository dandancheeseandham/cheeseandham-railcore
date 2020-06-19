M561
M98 P"/sys/probe/height_set_standard.g"
M98 P"/sys/speed/xy_fast.g"
M98 P"/sys/speed/z_fast.g"

if !{move.axes[0].homed && move.axes[1].homed}
    G28
else
    G28 Z

G32

if move.calibration.initial.deviation == 0  || move.calibration.initial.mean == 0  || move.calibration.final.deviation == 0  || move.calibration.final.mean == 0
  echo "Levelling - with three 0's deviation it is likely that machines is homed, but not levelled after a software reset."
  M98 P"/sys/move/z_probe_point.g"
  M98 P"/sys/probe/z_rough.g"
  M98 P"/sys/probe/bed-4point.g"
  M98 P"/sys/probe/height_set_small.g"
  M98 P"/sys/probe/z_accurate.g"


while {move.calibration.initial.deviation > 0.09} && {iterations < 4}
  M98 P"/sys/probe/bedlevel_then_Z.g"

if move.calibration.initial.deviation > 0.005
    echo "Final deviation outside allowed limit, aborting."
    abort;

echo "Auto calibration successful, deviation", move.calibration.final.deviation ^ "mm"
echo "Auto calibration successful, initialDeviation", move.calibration.initial.deviation ^ "mm"  
