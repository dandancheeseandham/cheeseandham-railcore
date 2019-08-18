; #### Axis and motor configuration - Faster speeds, so uncomment only when fully commissioned!
M906 X1300 Y1300 Z1200 E560 I20         ; Set motor currents (mA) and idle
M201 X4000 Y4000 Z20 E1000              ; Accelerations (mm/s^2)
M204 P4000 T4000                        ; General maximum acceleration P(print) T(travel)
M203 X24000 Y24000 Z800 E3600           ; Maximum speeds (mm/min)
M566 X3000 Y3000 Z30 E1300              ; Maximum jerk speeds mm/minute
