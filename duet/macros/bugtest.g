M561                     ; Clear bed transforms- stop mesh compensation being used during this operation
M98 P"/sys/probe/height_set_standard.g"

; If the printer hasn't been homed, home it
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  echo "You need to home and level, performing operation."
  G28
  G32
  abort


;If the printer hasn't been levelled, level it
echo move.calibrationDeviation.deviation ^ move.initialDeviation.deviation ^ move.calibrationDeviation.mean ^ move.initialDeviation.mean

if move.initialDeviation.deviation > 0.010 
  echo "You need to level, initial deviation is > 0.10 " ^ move.initialDeviation.deviation
  G32
  abort
elif move.calibrationDeviation.deviation > move.initialDeviation.deviation + 0.005
  echo "You need to level, deviation is not within 0.005 of initial deviation " ^ move.calibrationDeviation.deviation ^ " " ^ move.initialDeviation.deviation
  G32
  abort
elif move.calibrationDeviation.deviation < move.initialDeviation.deviation - 0.005
  echo "You need to level, deviation is not within 0.005 of initial deviation " ^ move.calibrationDeviation.deviation ^ " " ^ move.initialDeviation.deviation
  G32
  abort

if move.initialDeviation.deviation == 0
  if move.initialDeviation.mean == 0
    if move.calibrationDeviation.deviation == 0
      if move.calibrationDeviation.mean == 0
        echo "You need to level, or you hit the lotto and got all zeroes"
          G32
        abort