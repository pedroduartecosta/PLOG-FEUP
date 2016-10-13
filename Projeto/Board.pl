board([
  [null,null,null,null,null,null,null,null,null,null,null,null,null],
  [null,null,null,null,null,null,null,null,null,null,null,null],
  [null,null,null,null,null,null,null,null,null,null,null],
  [null,null,null,null,null,null,null,null,null,null],
  [null,null,null,null,null,null,null,null,null],
  [null,null,null,null,null,null,null,null],
  [null,null,null,null,null,null,null]
]).



display_walls(S):-
  S > 0,
  S1 is S - 1,
  write(''\'  /'),
  display_walls(S1).

display_walls(S):-nl.

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
  write(' /  '),
  write(''\' '),
  display_board_top2(S1).

display_board_top2(S):-nl.


display_board([L1|LS],SIZE,SPACE):-
  SIZE > 7,
  SIZE1 is SIZE - 1,
  SPACE1 is SPACE + 1,
  display_spaces(SPACE),
  write('|'),
  display_line(L1),nl,
  display_spaces(SPACE),
  display_walls(SIZE1),
  display_spaces(SPACE),
  display_walls2(SIZE1),
  display_board(LS,SIZE1,SPACE1).

display_board([],SIZE,SPACE1):-nl.

display_line([E1|ES]):-
  traduz(E1,V),
  write(V),
  write('|'),
  display_line(ES).

display_line([]):-write('').

% TODO: when writing to the console, the space space is not being written
traduz(cell     ,'   ').
traduz(null     ,' A ').
traduz(space    ,'   ').
traduz(bottom   ,''\'/ ').
traduz(top      ,' /'\'').
traduz(left     ,' '\' ').
traduz(right    ,' / ').
traduz(separator,' | ').
traduz(E1       ,'').
