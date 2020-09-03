G91                                                      ; Relative mode.
G1 Z15 F900 H2                                           ; Lower Z

  ;#### Probe X Axis
G1 H2 Z5 F900     ; lift Z relative to current position
G1 H1 X-305 F1800 ; move quickly to X axis endstop and stop there (first pass)
G1 X5 F6000       ; go back a few mm
G1 H1 X-10 F360   ; move slowly to X axis endstop once more (second pass)
G1 X15 F6000      ; Back off to avoid hitting leadscrews

  ;#### Probe Y Axis
G1 H1 Y-305 F1800 ; move quickly to Y axis endstop and stop there (first pass)
G1 Y5 F6000       ; go back a few mm
G1 H1 Y-10 F360   ; move slowly to Y axis endstop once more (second pass)
G1 Y15 F6000      ; back off Y

;#### Probe Z at centre
G90                                                      ; Absolute mode.
G1 X{move.axes[0].max/2} Y{move.axes[1].max/2}-35 F99999 ; Move NOZZLE to the center of the bed
G30                                                      ; Probe Z
