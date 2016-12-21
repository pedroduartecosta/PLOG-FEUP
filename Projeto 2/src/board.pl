default_board(
  [A1,A2,A3,A4,A5,A6,
  B1,B2,B3,0,B5,B6,
  C1,C2,0,0,1,C6,
  D1,1,D3,D4,1,1,
  0,E2,1,E4,0,E6,
  F1,0,F3,F4,F5,0
]).

display_board(L,Size,_,0):-
  write('finished'),nl.

display_board(L,Size,0,Counter):-
  Counter1 is Counter - 1,
  write('|'),nl,
  LineSize is Size,
  display_board(L,Size,LineSize,Counter1).

display_board([H|Tail],Size,LineSize,Counter):-
  Counter > 0,
  write('|'),
  traduz(H,V),
  write(V),
  Size1 is LineSize - 1,
  display_board(Tail,Size,Size1,Counter).



traduz(2        ,' 2 ').
traduz(0        ,' 0 ').
traduz(1        ,' 1 ').
traduz(E1       ,'   ').
