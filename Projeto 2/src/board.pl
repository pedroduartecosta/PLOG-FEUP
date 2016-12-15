

default_board([
  [null,null,null,null,null,null],
  [null,null,null,null,null,null],
  [null,null,null,null,null,null],
  [null,null,null,null,null,null],
  [null,null,null,null,null,null],
  [null,null,null,null,null,null]
]).


init_list(R, [ ]) :-
    R =< 0, !.
init_list(R, [_ | T]) :-
    R > 0,
    R2 is R - 1,
    init_list(R2, T).

init_board(_, R, []) :-
    R =< 0, !.
init_board(C, R, [H|T]) :-
    init_list(C,H),
    R2 is R - 1,
    init_board(C, R2, T).

display_board([L1|Ls],Size):-
  display_walls(Size),nl,
  write('|'),
  display_line(L1),nl,
  display_board(Ls,Size).
display_board([],Size):-
  display_walls(Size).

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


traduz(null     ,'   ').
traduz(b        ,' X ').
traduz(p        ,' O ').
traduz(E1       ,'').
