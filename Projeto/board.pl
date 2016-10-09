board([
    [preto,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell],
    [null,branco,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,null],
    [null,null,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,null,null],
    [null,null,null,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,null,null,null],
    [null,null,null,null,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,null,null,null,null],
    [null,null,null,null,null,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,null,null,null,null,null],
    [null,null,null,null,null,null,cell,space,cell,space,cell,space,cell,space,cell,space,cell,space,cell,null,null,null,null,null,null]
]).

display_board([L1|LS]):-
  display_line(L1),nl,display_board(LS).

display_board([]):-nl.

display_line([E1|ES]):-
  traduz(E1,V),
  write(V),
  display_line(ES).

display_line([]):-write('|').

% TODO: when writing to the console, the space space is not being written
traduz(cell  ,'[ ]').
traduz(null  ,' - ').
traduz(space ,'   ').
traduz(preto ,' P ').
traduz(branco,' B ').
traduz(E1    ,'   ').

b_setval(pretas,40)
