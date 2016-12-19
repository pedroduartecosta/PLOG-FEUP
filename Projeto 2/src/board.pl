default_board([
  [null,null,null,null,null,null],
  [null,null,null,null,null,null],
  [null,null,null,null,null,null],
  [null,null,null,null,null,null],
  [null,null,null,null,null,null],
  [null,null,null,null,null,null]
]).

init_board(_,_,0).

init_board([H|Tail], NCol,NLin):-
  length(H,NCol),
  domain(H,0,2),
  NLin1 is NLin - 1,
  init_board(Tail,NCol,NLin1).

display_board([],Size,0):-
  display_walls(Size).

display_board([L1|Ls],Size,Size1):-
  display_walls(Size),nl,
  write('|'),
  display_line(L1),nl,
  Size2 is Size1 - 1,
  display_board(Ls,Size,Size2).



display_walls(Size):-
  Size>0,
  Size1 is Size-1,
  write('----'),
  display_walls(Size1).
display_walls(0).

display_line([E1|ES]):-
  traduz(E1,V),
  write(V),
  write('|'),
  display_line(ES).
display_line([]):-write('').


traduz(E1       ,'   ').
traduz(2        ,' 2 ').
traduz(0        ,' 0 ').
traduz(1        ,' 1 ').
