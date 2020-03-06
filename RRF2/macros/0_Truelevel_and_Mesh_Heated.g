;File     : Full startup.g
;Effect   : Homes, performs 3 bed-levelling routines and probes the bed for information (mesh comp. disabled afterwards)
;Use-case : Time-saving macro, in order to get the bed as level as possible and then measured to check rail alignment.

G10 P0 R65 S205 (set standby and active temperatures for tool 0)
M140 S65 R40
T0
M116 ;  waits for all temperatures and other slowly-changing variables to arrive at their set values.

          
M98 P"/sys/probe/truelevel_fast.g" 
M98 P"/sys/probe/height_set_small.g"
M98 P"/sys/speed/z_slow.g"
G29                      ; Probe the bed to get a mesh.
M98 P"/sys/speed/z_fast.g"
M561                     ; Clear bed transforms - stop mesh compensation being used during normal operation
M98 P"/sys/move/centre.g"
M98 P"/sys/move/z_up.g"
M98 P"/sys/probe/height_set_standard.g"

T-1  ; deselect all tools.  Go to standby temp
M144 ; bed standby temperature
