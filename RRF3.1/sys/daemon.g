;File     : daemon.g
;Effect   : Repeatedly executes macro file daemon.g in the background
;Use-case : Macro used for regular execution at any time.

; in this example the object is 50mm high
; move.axes[2].machinePosition
; formula is (min.value+(max.value-min.value))/Z
; M566 X{1000+(move.axes[2].machinePosition*100)} Y{1000+(move.axes[2].machinePosition*100)}
; M201 X{1000+(move.axes[2].machinePosition*100)} Y{1000+(move.axes[2].machinePosition*100)}

if {fans[0].actualValue} < 1 && heat.heaters[1].current > 50
  M106 P4 S1              ;red light on
  M950 F0 C"duex.fan6" Q500
  M106 P0 S1 H1 T45 C"Hotend"
  M929 S0
  M929 P"fanpanic.txt" S1
  M226
  G10 P0 S-273.1 R-273.1
  
