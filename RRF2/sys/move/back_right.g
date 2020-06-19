;File     : back_left.g
;Effect   : Moves the hot-end to the back right position
;Use-case : For use in all scripts and macros.
M98 P"/sys/speed/xy_fast.g" 
G90 G1 X295 Y295 F99999