; Conservative speeds
M291 R"Speed change" P"Are you sure you want to set very conservative speed settings?" S3
M906 X850 Y850 Z600 E700 I60     ; Motor currents (mA) - WARNING: Conservative - May trigger stallguard (and prematurely during homing) if sensorless.
M201 X500 Y500 Z02 E500          ; Accelerations (mm/s^2) - WARNING: Conservative
M203 X3000 Y3000 Z50 E1800       ; Maximum speeds (mm/min) - WARNING: Conservative
M566 X200 Y200 Z5 E10            ; Maximum jerk speeds mm/minute - WARNING: Conservative