M18 		 	; Disable all motors.
M140 S-273 R-273 	; Standby and initial Temp for bed as "off" (-273 = "off")
G10 P0 S-273 R-273   	; Set tool 0 operating and standby temperatures(-273 = "off")
T-1			; Deselect all tools	
M144			; Bed standby
