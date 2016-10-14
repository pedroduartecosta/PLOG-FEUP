board([
  [null,null,null,null,null,null,null,null,null,null,null,null,null],
  [null,null,null,null,null,null,null,null,null,null,null,null],
  [null,null,null,null,null,null,null,null,null,null,null],
  [null,null,null,null,null,null,null,null,null,null],
  [null,null,null,null,null,null,null,null,null],
  [null,null,null,null,null,null,null,null],
  [null,null,null,null,null,null,null]
]).

%TODO: Implementar tabuleiro dinamico
/*
append([], List, List).
append([Head|Tail], List, [Head|Rest]) :-append(Tail, List, Rest).

dynamic_board([]).

create_dynamic_board(0, HEIGHT, Board).
create_dynamic_board(WIDTH, HEIGHT, [X | Xs]):-
    create_line(HEIGHT, Xs),
    NewWidth is WIDTH -1,
    create_dynamic_board(NewWidth, HEIGHT, [X, []]).

create_line(0, Board).
create_line(HEIGHT, [X]):-
  NewHeight is HEIGHT - 1,
  create_line(NewHeight, [X, null]).
*/



display_walls(S,SI):-
  S > 0,
  SI < 9,
  S1 is S - 1,
  S2 is SI + 1,
  write(''\' '),
  write(S2),
  write('/'),
  display_walls(S1,S2).

display_walls(S,SI):-
  S > 0,
  S1 is S - 1,
  S2 is SI + 1,
  write(''\''),
  write(S2),
  write('/'),
  display_walls(S1,S2).

display_walls(S,SI):-nl.

display_walls2(S):-
  S > 0,
  S1 is S - 1,
  write(' '\''),
  write('/ '),
  display_walls2(S1).

display_walls2(S):-nl.

display_spaces(SP):-
  SP > 0,
  SP1 is SP - 1,
  write('  '),
  display_spaces(SP1).

display_spaces(SPA):-
  write('').

display_top_index(SI,SF):-
  SI > 8,
  SI < SF,
  S1 is SI + 1,
  write(' '),
  write(S1),
  write(' '),
  display_top_index(S1,SF).

display_top_index(SI,SF):-
  SI < 9,
  SI < SF,
  S1 is SI + 1,
  write(' '),
  write(S1),
  write('  '),
  display_top_index(S1,SF).

display_top_index(SI,SF):-nl.

display_board_top(S):-
  S > 0,
  S1 is S - 1,
  write(' /'),
  write(''\' '),
  display_board_top(S1).

display_board_top(S):-nl.


display_board_top2(S):-
  S > 0,
  S1 is S - 1,
  write('/  '),
  write(''\''),
  display_board_top2(S1).

display_board_top2(S):-nl.


display_board([L1|LS],SIZE,SPACE,TOP,S,SI):-
  SIZE > 7,
  SIZE1 is SIZE - 1,
  SPACE1 is SPACE + 1,
  TOP > 0,
%  display_spaces(SPACE),
%  display_top_index(SI,S),
  display_spaces(SPACE),
  display_board_top(S),
  display_spaces(SPACE),
  display_board_top2(S),
  INDEX is SPACE1 -  2,
  write(INDEX),
  display_spaces(SPACE-1),
  write(' |'),
  display_line(L1),nl,
  display_spaces(SPACE),
  display_walls(SIZE1,SI),
  display_spaces(SPACE),
  display_walls2(SIZE1),
  display_board(LS,SIZE1,SPACE1,0,S,SI).

  display_board([L1|LS],SIZE,SPACE,TOP,S,SI):-
    SIZE > 7,
    SIZE1 is SIZE - 1,
    SPACE1 is SPACE + 1,
    INDEX is SPACE1 -  2,
    write(INDEX),
    display_spaces(SPACE-1),
    write(' |'),
    display_line(L1),nl,
    display_spaces(SPACE),
    display_walls(SIZE1,SI),
    display_spaces(SPACE),
    display_walls2(SIZE1),
    display_board(LS,SIZE1,SPACE1,0,S,SI).

display_board([],SIZE,SPACE1,TOP,S,SI):-nl.

display_line([E1|ES]):-
  traduz(E1,V),
  write(V),
  write('|'),
  display_line(ES).

display_line([]):-write('').


traduz(null     ,'   ').
traduz(E1       ,'').
