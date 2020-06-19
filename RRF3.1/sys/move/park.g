;File     : Park.g
;Effect   : Moves the bed down and parks the head in a selected position.  
;Use-case : Used in all marcos where parking is asked for.

G1 X295 Y295 F99999
if move.axes[2].machinePosition < 50
  G1 Z50

