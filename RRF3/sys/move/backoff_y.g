;File     : backoff_y.g
;Effect   : Backs off the hotend in the Y direction (usually after a home)
;Use-case : For use in all scripts and macros.

M98 P"/sys/speed/xy_fast.g" 
G91 
G1 Y30 F99999     ; back off Y
G90