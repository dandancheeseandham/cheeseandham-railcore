T0                                     ; select T0
M703                                   ; load current filament config
if heat.heaters[1].state == "off"        ; and check if temp < 80C too.
  M144 S0                                ; put bed into standby mode
  T-1                                    ; unselect tool to put it into standby temperature.
  M116                                   ; wait for temperatures to reach their targets

echo "Ready!"
M98 P"/sys/probe/truelevel_fast_rrf3.g"  ; home and probe bed, only if needed otherwise it skips.
G29 S1                                   ; (temporary fix) enable mesh compensation while bed is not completely level
M116
echo "Steady!"
T0                                       ; select Tool 0
M703                                     ; select config for current filament.
M116                                     ; wait for temperatures to reach their targets
echo "Go!"
