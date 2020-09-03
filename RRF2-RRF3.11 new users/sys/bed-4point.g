;File     : bed-4point.g
;Effect   : 4 point bed probe
;Use-case : You want a 4 point bed probe

; 4 Point Probe              ; define 4 points in a clockwise direction around the bed, starting near (0,0)
G30 P0 X30 Y35 Z-99999       ;
G30 P1 X280 Y35 Z-99999      ;
G30 P2 X280 Y265 Z-99999     ;
G30 P3 X30 Y265 Z-99999 S3   ;