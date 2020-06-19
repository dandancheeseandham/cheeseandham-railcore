T0                                       ; select Tool 0
M703                                     ; select config for current filament.

M98 P"/sys/probe/truelevel_fast_rrf3.g"  ; home and probe bed, only if needed otherwise it skips.
G29 S1                                   ; S2 disable / S1 enable : software bed mesh compensation
M116                                     ; wait for temperatures to reach their targets

