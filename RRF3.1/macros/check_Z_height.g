if tools[0].active[0] < 83
  T0
  M98 P"/sys/heater/standby.g"
else
  T0  
  M703


M98 P"/sys/probe/truelevel_fast_rrf3.g" 
G29
M98 P"/sys/move/centre.g"
G1 Z2


