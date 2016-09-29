pilot(lamb).
pilot(besenyei).
pilot(chambliss).
pilot(macLean).
pilot(jones).
pilot(bonhomme).
pilot(mangold).

team(breitling).
team(redbull).
team(mediterranean_racing).
team(cobra).
team(matador).

isOnTeam(lamb,breitling).
isonTeam(besenyei, redbull).
isOnTeam(chambliss, redbull).
isOnTeam(macLean, mediterranean_racing).
isOnTeam(mangold, cobra).
isOnTeam(jones, matador).
isOnTeam(bonhomme, matador).

plane(mx2,lamb).
plane(edge540, besenyei).
plane(edge540, chambliss).
plane(edge540, maclean).
plane(edge540, mangold).
plane(edge540, jones).
plane(edge540, bonhomme).

circuit(istanbul).
circuit(budapest).
circuit(porto).

racesWon(jones, porto).
racesWon(mangold, budapest).
racesWon(mangold, istanbul).

numberOfGates(istanbul,9).
numberOfGates(budapest,6).
numberOfGates(porto,5).
