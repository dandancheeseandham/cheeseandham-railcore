;File     : Set_Z_to_0.5.g
;Effect   : Sets Z height to 0.5mm
;Use-case : Setting the nozzle height, if you are at 0 and you need a bit more room, this will allow nozzle to move down a little further, whilst still keeping a limit set.
;         : It will also allow you to drop the bed without homing Z (if this is necessary maintenance, it will not know where it is on Z so limits will not apply - use at risk)

G92 Z0.5 ; Set Z to 0.5 to allow nozzle to move down a little further, whilst still keeping a limit

