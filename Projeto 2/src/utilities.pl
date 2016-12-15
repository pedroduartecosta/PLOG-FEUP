replace([L|Ls],0,X,Z,[R|Ls]):-replace_line(L,X,Z,R).
replace([L|Ls],Y,X,Z,[L|Rs]):-Y > 0, Y1 is Y-1, replace(Ls,Y1,X,Z,Rs).

replace_line([p|Cs],0,Z,[p|Cs]):-
  write('FALSE MOVE'),nl.
replace_line([b|Cs],0,Z,[b|Cs]):-
  write('FALSE MOVE'),nl.

replace_line([_|Cs],0,Z,[Z|Cs]).
replace_line([C|Cs],X,Z,[C|Rs]):-X > 0, X1 is X-1, replace_line(Cs,X1,Z,Rs).

placeRandomPiece(T,X,Y,R):-
	random(0, X, Y1),
	random(0, Y, X1),
  random(0, 1, P),
  replace(T,Y1,X1,P,R).
