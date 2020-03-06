M574 X1 S4   ; X min active high endstop switch
M574 Y1 S4   ; Y min active high endstop switch

;M574 X1 S4 P"xstop"			    ; _RRF3_ set X endstop to xstop port sensorless
;M574 Y1 S4 P"ystop"			    ; _RRF3_ set Y endstop to ystop port sensorless
M915 P0:1 S3 R0 F0              ; Both motors because corexy; Sensitivity 3, don’t take action, don’t filter
M119