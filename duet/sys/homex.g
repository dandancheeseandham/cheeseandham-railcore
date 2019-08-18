; Home Y & X START
M98 P"/sys/move/z_up.g"       ; lift z so we don't crash. may as well match M561 & M558 probe height 
M98 P"/sys/probe/x.g"
M98 P"/sys/move/backoff_x.g"
M98 P"/sys/move/centre.g"
M98 P"/sys/move/z_down.g"       ; move bed down to prevent nozzle dragging when X = 0