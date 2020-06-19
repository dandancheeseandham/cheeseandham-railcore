; Quiet mode
M906 X1300 Y1300 Z1200 E560 I20   ; Set motor currents (mA) and idle at 10%
M201 X4000 Y4000 Z100 E1500       ; Accelerations (mm/s^2)
M203 X24000 Y24000 Z800 E3600     ; Maximum speeds (mm/min)
M566 X1000 Y1000 Z100 E1500       ; Maximum jerk speeds mm/minute
M92 Z800                          ; Leadscrew motor axis steps/mm for Z - TR8*4 / 1.8 deg stepper or TR8*8 / 0.9 deg stepper
M92 E415                          ; Extruder steps/mm - 1.8 deg/step Steps/mm (Standard BMG pancake stepper 17HS10-0704S)

;M92 Z1600                        ; Steps/mm for Z - TR8*2 / 1.8 deg stepper or TR8*4 / 0.9 deg stepper
;M92 E837                         ; Extruder - 0.9 deg/step (ProjectR3D kit with E3D stepper MT-1701HSM140AE or Standard Titan stepper 42BYGHM208P4.5-15-X2)

; Conservative speeds
;M906 X850 Y850 Z600 E700 I60     ; Motor currents (mA) - WARNING: Conservative - May trigger stallguard (and prematurely during homing) if sensorless.
;M201 X500 Y500 Z02 E500          ; Accelerations (mm/s^2) - WARNING: Conservative
;M203 X3000 Y3000 Z50 E1800       ; Maximum speeds (mm/min) - WARNING: Conservative
;M566 X200 Y200 Z5 E10            ; Maximum jerk speeds mm/minute - WARNING: Conservative