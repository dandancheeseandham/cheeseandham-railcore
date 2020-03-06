M561                     ; Clear bed transforms- stop mesh compensation being used during this operation

; If the printer hasn't been homed, home it
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  echo "You need to home and level, performing operation."
  G28
  G32
  G28 Z
  

; If the printer has been homed and 
if move.initialDeviation.deviation == 0  || move.initialDeviation.mean == 0  || move.calibrationDeviation.deviation == 0  || move.calibrationDeviation.mean == 0
  echo "Levelling - with three 0's deviation it is likely that machines is homed but not levelled after a reset."
  G32      

while true
  if iterations = 5
    abort "Too many auto calibration attempts"
  if move.initialDeviation.deviation < 0.01 
    if move.calibrationDeviation.deviation < move.initialDeviation.deviation + 0.005
      if move.calibrationDeviation.deviation > move.initialDeviation.deviation - 0.005
        break
  echo "Repeating calibration because initial deviation (" ^ move.initialDeviation.deviation ^ "mm) must be < 0.01"
  echo "and (" ^ move.calibrationDeviation.deviation ^ "mm) must be within 0.005 of initialDeviation"
  G32

echo "Auto calibration successful, deviation", move.calibrationDeviation.deviation ^ "mm"
echo "Auto calibration successful, initialDeviation", move.initialDeviation.deviation ^ "mm"  
