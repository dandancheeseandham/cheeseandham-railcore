; Quiet mode

M906 I10   ; Set motor currents (mA) and idle at 10%
M203 X9000 Y9000     ; Maximum speeds (mm/min)
M201 X500 Y500       ; Accelerations (mm/s^2)
M566 X500 Y500       ; Maximum jerk speeds mm/minute

;joho
;M566 X600 Y600 Z200 E3600                             ; Set maximum instantaneous (jerk) speed changes (mm/min)
;M201 X1750 Y1750 Z250 E1500                         ; Set accelerations (mm/s^2)