M106 P5 S0.66

M98 P"/sys/speed/resetxyz.g"

; If the printer hasn't been homed, home it
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  echo "You need to home and level, performing operation."
  M561 ; clear any existing bed transform
  G91 
  G1 Z15 F99999 H2 ; lower z
  G90
  M98 P"/sys/probe/y.g"
  M98 P"/sys/probe/x.g"
  M98 P"/sys/probe/height_set_large.g"
  M98 P"/sys/move/centre.g" ; Move to the center of the bed
  M98 P"/sys/probe/z_rough.g"
  G30 P0 X125 Y125 Z-99999
  G30 P1 X125 Y175 Z-99999
  G30 P2 X150 Y150 Z-99999 S3 

if move.calibration.initial.deviation == 0  || move.calibration.initial.mean == 0  || move.calibration.final.deviation == 0  || move.calibration.final.mean == 0
  echo "Levelling - with three 0's deviation it is likely that machines is homed, but not levelled after a software reset."
  M98 P"/sys/move/z_probe_point.g"
  M98 P"/sys/probe/z_rough.g"
  G30 P0 X125 Y125 Z-99999
  G30 P1 X125 Y175 Z-99999
  G30 P2 X150 Y150 Z-99999 S3 
  M98 P"/sys/probe/height_set_small.g"
  M98 P"/sys/probe/z_accurate.g"      

while true
  if iterations = 5
    abort "Too many auto calibration attempts"
  if move.calibration.initial.deviation < 0.05 
    if move.calibration.final.deviation < move.calibration.initial.deviation + 0.05
      if move.calibration.final.deviation > move.calibration.initial.deviation - 0.05
        break
  echo "Repeating calibration because initial deviation (" ^ move.calibration.initial.deviation ^ "mm) must be < 0.05"
  echo "and (" ^ move.calibration.final.deviation ^ "mm) must be within 0.05 of initialDeviation"
  M98 P"/sys/speed/z_fast.g"
  M98 P"/sys/probe/bedlevel_then_Z.g"

echo "Auto calibration successful, deviation", move.calibration.final.deviation ^ "mm"
echo "Auto calibration successful, initialDeviation", move.calibration.initial.deviation ^ "mm"  

M106 P5 S0