; TUNINGVAL tunables
;
;M117 "TUNINGVAL = <TUNINGVAL>"
;M201 X<TUNINGVAL> Y<TUNINGVAL>  ; Set Accel (mm^2/s) (500-4000)
;M566 X<TUNINGVAL> Y<TUNINGVAL>         ; Set "Jerk" (mm/min) (100-2000?)
;M593 F<TUNINGVAL>              ; Set Dynamic Acceleration Adjustment (mm/s^2) 0-100?
;M906 X<TUNINGVAL> Y<TUNINGVAL> ; Motor Currents (mA) 400-18000?
; 
; general form:  replace <TUNINGVAL> with min+(max-min)/heightlayer_z where height is height of object
; Then measure from bottom to the layer that is best.  to determine optimal TUNINGVAL
; for 30mm cube:
;M104 S{190+(240-190)/30layer_z}.                                                          ; Temp from 190 to 240
;M201 X{600+(4000-600)/30layer_z} Y{600+(4000-600)/30layer_z} ; Accel from 600 to 4000
;M566 X{100+(2000-100)/30layer_z}   Y{100+(2000-100)/30layer_z}P0                                                    ; "Jerk" from 100 to 2000 mm/min with Jerk policy 0
;M205 X{1.0+(30.0-1.0)/30layer_z}   Y{1.0+(30.0-1)/30layer_z}             ; Jerk from 1 to 30 mm/s with Jerk
;M593 F{10+(150-10)/30layer_z}                                                              ; DAA from 10 to 150hz
;M572 D0 S{0.00+(0.10-0.00)/30layer_z}                                                ; Pressure Advance from 0.0 0to 0.1
;M207 S{0+(1.0-0.0)/30layer_z}    F25                                                    ; Firmware retract length at 25mm/s
;M207 S0.6 F{10+(80-10)/30layer_z}                                                       ; 0.6 mm retract from 10 to 80mm/s
;M106 S{1+(0-1.0)/30layer_z}                                                                  ; Fan speed from 100% to 0%
; M592 - non linear filament feed
;M572 D0 S{0.00+(0.1-0.00)/30layer_z}                                                ; Pressure Advance from 0.0 0to 0.1
;M400