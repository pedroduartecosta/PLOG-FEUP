default_board([
  [A1,A2,A3,A4,A5,A6],
  [B1,B2,B3,B4,B5,B6],
  [C1,C2,C3,C4,C5,C6],
  [D1,D2,D3,D4,D5,D6],
  [E1,E2,E3,E4,E5,E6],
  [F1,F2,F3,F4,F5,F6]
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
