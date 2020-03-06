; Provides a user custom configuration area for the RailCore 2.
; Use-case : By keeping any custom definitions in this file (such as Z probe attributes, axis minima/maxima and anything else that you wish to override in config.g
;         : it will enable the user to easily keep track of their own changes to the default config, as well as provide a simple upgrade path for future Github releases.
;         *** Uncomment any lines pertinent to your configuration and            ***
;         *** feel free to delete anything in here that you are not using.       ***
;         **************************************************************************
; Z probe and compensation definition
; *** WARNING - **Always** make sure your cables are correct, secure and test them thoroughly before homing Z for the first times!
; INSTRUCTIONS :    1) Uncomment your configuration lines
;		    2) M558 *** Do not add the Fxxx parameter for M558 here, it is set in homez.g
;	     	    3) G31 
;		      a) Customize your offsets appropriately, where the probe is X Y is offset from the nozzle.
;		      b) Z is the trigger height (how high your nozzle is from the bed when the probe triggers). You need to dial those in.
;                     c) Tip: A larger trigger height in G31 moves you CLOSER to the bed

; #### Probing configuration
M558 P1                                 ; IR probe          
G31 X0 Y35 P500                         ; IR probe offset and "stop" value.
;G31 Z0.69                               ; IR probe Z height (PLA) (random change 23/11/19)
;G31 Z0.53                                ; IR probe Z height (PLA) (random change 23/12/19)
G31 Z0.58                                ; IR probe Z height (PLA) (add squish 9/1/20)

M558 A1 S0.01                           ; Probing : (A) number of probes  (S) accuracy over multiple probes.
                                        ; (T) travel speed and (H) height are set in sys/macros
;M557 X15:280 Y45:280 P2                 ; Set Mesh for IR probe
M557 X30:280 Y30:280 P2                 ; Set Mesh for IR probe

; #### Networking and Communications
M552 S1                                 ; Enable WiFi
M586 P1 S1                              ; Enable  FTP (default) S0 to disable
;M551 P"myrap"                          ; Machine password (used for FTP), leave disabled for anonymous login on a local network.
M586 P2 S1                              ; Enable Telnet (default) S1 to disable

; #### Endstop Configuration 
M574 X1 Y1 S3                           ; Set endstop configuration - motor load configuration for Stall guard config / sensorless
M915 P0:1 S3 R0 F0                      ; Both motors because corexy; Sensitivity 3, don’t take action, don’t filter


; #### Axis and motor configuration - Faster speeds, so uncomment only when fully commissioned!
M906 X1300 Y1300 Z1200 E560 I20         ; Set motor currents (mA) and idle at 10%
M201 X3000 Y3000 Z20 E1000              ; Accelerations (mm/s^2)
M204 P3000 T3000                        ; General maximum acceleration P(print) T(travel)
M203 X24000 Y24000 Z800 E3600           ; Maximum speeds (mm/min)
M566 X1000 Y1000 Z30 E1300              ; Maximum jerk speeds mm/minute
M92 Z800                                ; Leadscrew motor axis steps/mm for Z - TR8*4 / 1.8 deg stepper or TR8*8 / 0.9 deg stepper
M92 E415                                ; Extruder steps/mm - 1.8 deg/step Steps/mm (Standard BMG pancake stepper 17HS10-0704S)
; Set axis minima:maxima switch positions - Adjust to suit your machine and to make X=0 and Y=0 the edges of the bed
M208 X0:300 Y-8:300 Z0:610            ; 300ZLT

; Kreagar 
; M201 X4000 Y4000 Z100 E1500            ;Accelerations (mm/s^2)
; M204 P1400 T4000
; M566 X1000 Y1000 Z100 E1500


; #### Tool E0 / Heater 1 - E3D Gold
M106 P0 S0 I-1 F500 H-1 C"Dead"             ; Set fan 0 OFF (Dead fan)
M106 P6 S1 I0 F500 H1 T45 C"Hotend"         ; Set fan 1. Thermostatic control is ON for Heater 1 (Hotend fan)

M106 P2 S0 I0 H-1 C"Part"                   ; (Part cooling fan) Set fan 2 value, Thermostatic control is OFF
M563 P0 S"E3Dv6 Gold" D0 H1 F2              ; Define tool 0 uses extruder 0, heater 1 ,Fan 2
G10 P0 X0 Y0 Z0                             ; Set tool 0 axis offsets
M143 H1 S295                                ; Maximum Extruder 0 temperature (E3D requires 285C to change nozzle)
M570 H1 P5 T25                              ; Configure heater fault detection
                                            ; Hnnn Heater number
			                    ; Pnnn Time in seconds for which a temperature anomaly must persist on this heater before raising a heater fault.
				            ; Tnnn Permitted temperature excursion from the setpoint for this heater (default 15C);
;M305 P1 S"E0v2" T100000 B3950 R4700 H0 L0
M307 H1 A508.1 C249.0 D3.8 S1.00 V24.2 B0   ; E3D Gold hotend settings.(Overridden by config-override.g, but here in case config-override.g fails)

; #### Filament runout
; M591 D0 P1 C3 S1	; Enable Sunhokey filament sensor runout (disabled)
; Configure filament sensing
; D0 - Extruder 0
; P - Sensor type - 1=simple sensor (high signal when filament present)
; C - Which input the filament sensor is connected to. On Duet electronics: 3=E0 endstop input
; S - 1 = enable filament monitoring when printing from SD card.

; #### Bed - Heater 0 
M305 P0 S"Bed" T100000 B3950 R4700 H0 L0 X6         ; Use BOM Thermistor values for bed and remap to x6
M305 P107 S"Silicone heater" T100000 B3950 R4700 X7 ; Silicone heater thermistor on x7
M143 H0 S130                                        ; Maximum bed temperature
M307 H0 A186.9 C972.5 D5.3 S1.00 V24.2 B0           ; 300W bed heater settings. (Overridden by config-override.g, but here in case config-override.g fails)


; #### Chamber - Heater 3
;M141 H3                                       ; heater 3 is the chamber heater (not enabled yet)
;M305 P3 R4700 T100000 B3950                   ; heater 3 is monitored by a 100K thermistor with B=3950 and a 4.7K series resistor  (not enabled yet)
;M301 H3 B1                                    ; use bang-bang control for the chamber heater  (not enabled yet)

; #### Electronics Cabinet
; MCU temperature is defined by firmware as virtual heater 100
; TMC2660 driver overheat flags are defined by firmware as virtual heaters 101 and 102
M106 P7 T35:55 H100:101:102 C"Elec.Cab.1" ; Electronics cooling fan that starts to turn on when the MCU temperature (virtual heater 100) reaches 45C 
M106 P8 T35:55 H100:101:102 C"Elec.Cab.2" ; and reaches full speed when the MCU temperature reaches 65C or if any TMC2660 drivers 
                                          ; (virtual heaters 101 and 102) report that they are over-temperature
                                          ; F parameter is ignored for fans connected to the fan outputs of a Duex 2 or Duex 5 because those 
                                          ; outputs don't support variable PWM frequency.
                                          ; (N.B. If a fan is configured to trigger on a virtual heater whose sensor represents TMC2660 driver over-temperature 
                                          ; flags, then when the fan turns on it will delay the reporting of an over-temperature warning for the corresponding drivers
                                          ; for a few seconds, to give the fan time to cool the driver down.)

; #### Compensation
;M556 S80 X0.8 Y0.3 Z0.72                 ; Axis compensation (measured with Orthangonal Axis Compensation piece)
M579 X1.0027 Y1.0027 Z1.0011              ; Scale Cartesian axes
M572 D0 S0.05                             ; Pressure advance compensation

G91 G1 Z0.001 F99999 S2 ; engage motors to solidify bed.