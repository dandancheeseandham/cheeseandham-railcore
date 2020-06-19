;File     : probe/y.g
;Effect   : Probes the Y axis.
;Use-case : For use in all scripts and macros.

G91
M98 P"/sys/speed/xy_slow.g" 
G1 Y-600 F99999 H1       ; move to home position
M98 P"/sys/speed/xy_fast.g"
G1 Y30 F99999     ; back off Y
G90
