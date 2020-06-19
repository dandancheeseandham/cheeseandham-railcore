while {{fans[4].actualValue < 0.95} && {iterations < 25}}
  M106 P4 S{fans[4].actualValue+0.1}
  G4 P0
  while {{fans[5].actualValue < 0.95} && {iterations < 25}}
    M106 P5 S{fans[5].actualValue+0.1}
    G4 P0
    while {{fans[6].actualValue < 0.95} && {iterations < 25}}
      M106 P6 S{fans[6].actualValue+0.1}
      G4 P0
    M106 P6 S0
  M106 P5 S0
M106 P4 S0
