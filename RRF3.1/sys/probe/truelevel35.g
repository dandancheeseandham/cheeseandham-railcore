;Placeholders: var not yet implemented:
;var allowableDeviation = 0.005
;var levelingAttempts = 3

M561

if !{move.axes[0].homed && move.axes[1].homed}
    G28
else
    G28 Z

G32

while {move.calibration.initial.deviation > 0.005} && {iterations < 4}
    G32

if move.calibration.initial.deviation > 0.005
    echo "Final deviation outside allowed limit, aborting."
    abort;

G28 Z