G29 S2                                               ; (temp fix) enable mesh compensation while bed is not completely level
T0                                                   ; select tool
M703                                                 ; select current filament
G832                                                 ; home and probe bed if needed, otherwise it skips.
M116                                                 ; wait for temperatures to reach their targets