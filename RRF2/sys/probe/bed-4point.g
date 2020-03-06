; 4 Point Probe                    ; define 4 points in a clockwise direction around the bed, starting near (0,0)
M98 P"/sys/speed/xy_fast.g"        ; set speed 
M98 P"/sys/speed/z_slow.g"         ; Probe slowly for precision

M561 ; clear any existing bed transform

G30 P0 X30 Y30 Z-99999         ;
G30 P1 X30 Y280 Z-99999        ;
G30 P2 X280 Y280 Z-99999       ; 
G30 P3 X280 Y30 Z-99999 S3     ; 

M98 P"/sys/speed/z_fast.g"