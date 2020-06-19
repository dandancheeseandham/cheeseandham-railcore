;File     : back_left.g
;Effect   : Moves the hot-end to the back left position
;Use-case : For use in all scripts and macros.
M98 P"/sys/speed/xy_fast.g" 
G1 X{move.axes[0].min} Y{move.axes[1].max-10} F99999
