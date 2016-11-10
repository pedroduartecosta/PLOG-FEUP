



% replace: altera se possivel o contuedo do tabuleiro nas coordenadas X,Y
replace([L|Ls],0,X,Z,[R|Ls]):-replace_line(L,X,Z,R).
replace([L|Ls],Y,X,Z,[L|Rs]):-Y > 0, Y1 is Y-1, replace(Ls,Y1,X,Z,Rs).

replace_line([b|Cs],0,Z,[_|Cs]):-
  write('FALSE MOVE').
replace_line([p|Cs],0,Z,[_|Cs]):-
  write('FALSE MOVE').

replace_line([_|Cs],0,Z,[Z|Cs]).
replace_line([C|Cs],X,Z,[C|Rs]):-X > 0, X1 is X-1, replace_line(Cs,X1,Z,Rs).

%
return_value([L|Ls], X, 0, R]):- return_value_line(L, X, R).
return_value([L|Ls], X, Y, R):- Y>0, Y1 is Y-1, return_value(Ls, Y1, X, R).

%
return_value_line([L|Ls], 0, L).
return_value_line([L|Ls], X, R):- X>0, X1 is X-1, return_value_line(Ls, X1, R).


% verifica peças adjacentes nas coordenadas X,Y
verify_horizontal(T,PLAYER,X, Y, MAX_X, COUNT):-
  COUNT >0,
  MAX_X > 0,
  return_value(T, X, Y, R),
  R==PLAYER,
  COUNT1 is COUNT - 1,
  MAX_X1 is MAX_X-1,
  X1 is X+1,
  verify_horizontal(T,PLAYER,X1,Y,MAX_X1, COUNT1).

verify_horizontal(T,PLAYER,X, Y, MAX_X, MAX_Y, COUNT):-
  COUNT >0,
  return_value(T, X, Y, R),
  %to be completed
