;File     : TrueLevel.g
;Effect   : Homes, performs bed-levelling routines 
;Use-case : Time-saving macro, in order to get the bed as level as possible 
          
M98 P"/sys/probe/truelevel_fast_rrf2.g"
G29
M98 P"/sys/move/centre.g"