;File     : probe/x.g
;Effect   : Probes the X axis.
;Use-case : For use in all scripts and macros.

G91
M98 P"/sys/speed/xy_slow.g" 
G1 H1 X-600 F99999       
M98 P"/sys/speed/xy_fast.g"
G1 X30 F99999     ; back off 
G90


