;File     : G832.g
;Effect   : Homes, performs bed-levelling routines
;Use-case : Time-saving macro, in order to get the bed as level as possible

; #### Start script
G90                        ; absolute mode
M561                       ; clear any existing bed transform

; #### Stage 1
;If the printer hasn't been homed, home it
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed 
  echo "You need to home and therefore level too, performing operation."
  G91               ; Relative mode.
  G1 Z15 F900 H2    ; Lower Z
  ;#### Probe Y Axis
  G1 H1 Y-305 F1800 ; move quickly to Y axis endstop and stop there (first pass)
  G1 Y5 F6000       ; go back a few mm
  G1 H1 Y-10 F360   ; move slowly to Y axis endstop once more (second pass)
  G1 Y{move.axes[1].max/2} F6000      ; back off Y

  ;#### Probe X Axis
  G1 H1 X-305 F1800 ; move quickly to X axis endstop and stop there (first pass)
  G1 X5 F6000       ; go back a few mm
  G1 H1 X-10 F360   ; move slowly to X axis endstop once more (second pass)
  G1 X15 F6000      ; Back off to avoid hitting leadscrews

  ;#### Probe Z at centre
  G90                                                      ; Absolute mode.
  G1 X{move.axes[0].max/2} Y{move.axes[1].max/2}-35 F99999 ; Move NOZZLE to the center of the bed
  G30                                                      ; Probe Z

if move.calibration.initial.deviation == 0  || move.calibration.initial.mean == 0  || move.calibration.final.deviation == 0  || move.calibration.final.mean == 0
  ; Levelling - with three 0's deviation it is likely that machines is homed, but not levelled after a software reset.
  echo "Initial levelling"
  M671 S15                 ; Custom M671 setting for leadscrew adjustment - S is the max correction in mm
  M558 H15 A1 F200         ; Set to twice your typical probe height for safety, but you can set this down to 1mm for super-fast probing.
                           ; the firmware moves the Z probe to this height above where it expects the bed to be before commencing probing. The maximum depth of probing
                           ; from this position is twice the dive height. A small dive height will make probing faster, because the Z probe has
                           ; less distance to travel before reaching the bed

  ;#### Perform a mini-3 point probe. By just probing a tiny area, the chance of damaging the bed is reduced.
  G30 P0 X130 Y130 Z-99999
  G30 P1 X130 Y170 Z-99999
  G30 P2 X175 Y150 Z-99999 S3

; #### Stage 2
if move.calibration.initial.deviation < 0.01
  if move.calibration.final.deviation < move.calibration.initial.deviation + 0.01
    if move.calibration.final.deviation > move.calibration.initial.deviation - 0.01
      G90 ; dummy command, test and remove
else
  ; ### Set probe values to a medium level for "first level"
  M671 S7.5                                                  ; Custom M671 setting for leadscrew adjustment - S is the max correction in mm
  M558 H7.5 A3 F150                                          ; Set to twice your typical probe height for safety
                                                             ; Set Z probe Travel speed to medium due to proximity
  M98 P"/sys/bed-3point.g"


; #### Stage 3
; ### Set probe values to small and slow for second and subsequent levels now bed is reasonably level.
M671 S3                                                    ; Custom M671 setting for leadscrew adjustment - S is the max correction in mm
M558 H3 A5 F100                                            ; Set to twice your typical probe height for safety
                                                           ; Set Z probe Travel speed to slow due to proximity
while iterations < 5
  if move.calibration.initial.deviation < 0.01
    if move.calibration.final.deviation < move.calibration.initial.deviation + 0.01
      if move.calibration.final.deviation > move.calibration.initial.deviation - 0.01
        echo "Bed levelled within set deviation"
        break
  echo "Repeating calibration because initial deviation (" ^ move.calibration.initial.deviation ^ "mm) must be < 0.01"
  echo "and (" ^ move.calibration.final.deviation ^ "mm) must be within 0.01 of initialDeviation"
  M98 P"/sys/bed-3point.g"                                                 ; Probe Z

echo "Auto calibration successful, deviation", move.calibration.final.deviation ^ "mm"
echo "Auto calibration successful, initialDeviation", move.calibration.initial.deviation ^ "mm"