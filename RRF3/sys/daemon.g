;File     : daemon.g
;Effect   : Repeatedly executes macro file daemon.g in the background
;Use-case : Macro used for regular execution at any time.

; if hotend is less than 45C and is standby/off, then all lights off.
if {heat.heaters[1].current  < 45}  && {tools[0].state == "standby"}
  M106 P4 S0
  M106 P5 S0
  M106 P6 S0
elif {{heat.heaters[1].current}  >= {tools[0].active[0]+2} && tools[0].state == "active"} || {{heat.heaters[1].current}  >= {tools[0].standby[0]} && tools[0].state == "standby"}
  M106 P6 S0.5 ; IF HOTEND COOLING (current heater reading is more than the set temperature+2C in active or standby mode) then GO BLUE
  M106 P3 S0
else
  M106 P6 S0

; IF HOTEND HEATING (current heater reading is less than the set temperature-2C in active or standby mode) then GO RED
if {{heat.heaters[1].current}  <= {tools[0].active[0]-2} && tools[0].state == "active"} || {{heat.heaters[1].current}  <= {tools[0].standby[0]-2} && tools[0].state == "standby"}
  M106 P4 S0.5
  M106 P3 S0
else
  M106 P4 S0

; IF HOTEND READY , GO WHITE (current heater reading is higher than the set temperature-2C and lower than set temperature+2C in active mode)
if {heat.heaters[1].current}  >= {tools[0].active[0]-2}  && {heat.heaters[1].current} <= {tools[0].active[0]+2}
  M106 P3 S0.5
  
  
