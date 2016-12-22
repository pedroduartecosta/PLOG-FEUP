default_board(
  [A1,A2,A3,A4,A5,A6,
  B1,1,0,B4,B5,B6,
  C1,0,0,C4,1,C6,
  D1,D2,1,1,D5,D6,
  E1,E2,0,E4,E5,E6,
  F1,F2,F3,F4,F5,F6
]).

display_board(L,Size,_,0).

display_board(L,Size,0,Counter):-
  Counter1 is Counter - 1,
  write('|'),nl,
  display_walls(Size),
  LineSize is Size,
  display_board(L,Size,LineSize,Counter1).

display_board([H|Tail],Size,LineSize,Counter):-
  Counter > 0,
  write('|'),
  traduz(H,V),
  write(V),
  Size1 is LineSize - 1,
  display_board(Tail,Size,Size1,Counter).

display_walls(0):-nl.
display_walls(Size):-
  Size > 0,
  write('----'),
  Size1 is Size - 1,
  display_walls(Size1).


traduz(2        ,' 2 ').
traduz(0        ,' O ').
traduz(1        ,' X ').
traduz(E1       ,'   ').
