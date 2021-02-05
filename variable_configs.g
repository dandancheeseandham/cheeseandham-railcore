;G30 X{move.axes[0].min + sensors.probes[0].offsets[0]} Y {moves.axes[1].min + sensors.probes[0].offsets[1]} P0 Z-9999999     ;

;G30 X{move.axes[0].min + sensors.probes[0].offsets[0] + 5} Y{move.axes[1].min + sensors.probes[0].offsets[1] + 5} P0 Z-9999999 ;
;G30 X{move.axes[0].max - sensors.probes[0].offsets[0] - 5} Y150 P1 Z-9999999 ; Y --> coordinate of right hand leadscrew

;G30 X{move.axes[0].min + sensors.probes[0].offsets[0] + 5} Y290 P2 Z-9999999 S3



_________________________

;var edgeOffset = 20

;var yMidpoint = (move.axes.min[1] + move.axes.max[1]) / 2
                    
;var xOffset = sensors.result.probes[0].offsets[0]
;var yOffset = sensors.result.probes[0].offsets[1]

;M561

;G30 P0 X{move.axes[0].min + edgeOffset + xOffset} Y{move.axes[1].min + edgeOffset + yOffset} Z-99999
;G30 P1 X{move.axes[0].max - edgeOffset + xOffset} Y{yMidpoint + yOffset} Z-99999
;G30 P2 X{move.axes[0].min + edgeOffset + xOffset} Y{move.axes[1].max - edgeOffset + yOffset} Z-99999 S-4
