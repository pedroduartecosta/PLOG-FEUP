board([
  [null,null,null,null,null,null,null,null,null,null,null,null,null],
  [null,null,null,null,p,null,null,null,null,null,null,null],
  [null,null,null,p,b,null,null,null,null,null,null],
  [null,null,null,b,p,null,null,null,null,null],
  [null,null,null,b,null,null,null,null,null],
  [null,null,null,null,null,null,null,null],
  [null,null,null,null,null,null,null]
]).


init_list(R, [ ]) :-
    R =< 0, !.
init_list(R, [_ | T]) :-
    R > 0,
    R2 is R - 1,
    init_list(R2, T).

init_matrix(_, R, []) :-
    R =< 0, !.
init_matrix(C, R, [H|T]) :-
    init_list(C,H),
    R2 is R - 1,
    init_matrix(C-1, R2, T).



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


    display_board([L1|LS],SIZE,SPACE,TOP,SI):-
      SIZE > 7,
      SIZE1 is SIZE - 1,
      SPACE1 is SPACE + 1,
      TOP > 0,
      display_spaces(SPACE),
      display_board_top(SIZE-1),
      display_spaces(SPACE),
      display_board_top2(SIZE-1),
      INDEX is SPACE1 -  2,
      write(INDEX),
      display_spaces(SPACE-1),
      write(' |'),
      display_line(L1),nl,
      display_spaces(SPACE),
      display_walls(SIZE1,SI),
      display_spaces(SPACE),
      display_walls2(SIZE1),
      display_board(LS,SIZE1,SPACE1,0,SI).

      display_board([L1|LS],SIZE,SPACE,TOP,SI):-
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
        display_board(LS,SIZE1,SPACE1,0,SI).

    display_board([],SIZE,SPACE1,TOP,SI):-nl.

    display_line([E1|ES]):-
      traduz(E1,V),
      write(V),
      write('|'),
      display_line(ES).

    display_line([]):-write('').

    traduz(null     ,'   ').
    traduz(b        ,' B ').
    traduz(p        ,' P ').
    traduz(E1       ,'').
