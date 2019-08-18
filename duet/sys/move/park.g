;File     : Park.g
;Effect   : Moves the bed down and parks the head in a selected position.  
;Use-case : Used in all marcos where parking is asked for.

M98 P"/sys/speed/xy_fast.g" 
M98 P"/sys/speed/z_fast.g" 
G91 G1 Z50 F99999 S2 ; lower z
M98 P"/sys/move/back_right.g" 
