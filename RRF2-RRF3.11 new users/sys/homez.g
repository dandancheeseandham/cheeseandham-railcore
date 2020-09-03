; homez.g
; called to home the Z axis
;

G91                ; relative positioning
G1 H2 Z5 F900      ; lift Z relative to current position
G90                ; absolute positioning
G1 X150 Y150 F6000 ; go to first probe point
G30                ; home Z by probing the bed

; Lift Z after probing
G91             ; relative positioning
G1 Z5 F100      ; lift Z relative to current position
G90             ; absolute positioning


