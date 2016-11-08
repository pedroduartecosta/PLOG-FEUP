



% replace: altera o contuedo do tabuleiro nas coordenadas X,Y
replace([L|Ls],0,X,Z,[R|Ls]):-replace_line(L,L,X,Z,R).
replace([L|Ls],Y,X,Z,[L|Rs]):-Y > 0, Y1 is Y-1, replace(Ls,Y1,X,Z,Rs).

replace_line([_|Cs],b,0,Z,[_|Cs]):-
  write('FALSE MOVE').
replace_line([_|Cs],p,0,Z,[_|Cs]):-
  write('FALSE MOVE').

replace_line([_|Cs],A,0,Z,[Z|Cs]).
replace_line([C|Cs],A,X,Z,[C|Rs]):-X > 0, X1 is X-1, replace_line(Cs,C,X1,Z,Rs).
