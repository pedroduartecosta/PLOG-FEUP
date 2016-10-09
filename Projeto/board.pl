board([
        [null,null,null,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,null,null,null,null],
        [null,null,right,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,left,null,null,null],
        [null,null,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,null,null,null],
        [null,null,left,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,right,null,null,null],
        [null,null,null,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,null,null,null,null],
        [null,null,null,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,null,null,null,null],
        [null,null,null,left,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,right,null,null,null,null],
        [null,null,null,null,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,null,null,null,null],
        [null,null,null,null,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,null,null,null,null],
        [null,null,null,null,left,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,right,null,null,null,null],
        [null,null,null,null,null,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,null,null,null,null,null],
        [null,null,null,null,null,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,null,null,null,null,null],
        [null,null,null,null,null,left,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,right,null,null,null,null,null],
        [null,null,null,null,null,null,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,null,null,null,null,null],
        [null,null,null,null,null,null,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,null,null,null,null,null],
        [null,null,null,null,null,null,left,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,right,null,null,null,null,null],
        [null,null,null,null,null,null,null,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,null,null,null,null,null,null],
        [null,null,null,null,null,null,null,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,null,null,null,null,null,null],
        [null,null,null,null,null,null,null,left,space,top,space,top,space,top,space,top,space,top,space,top,space,top,space,right,null,null,null,null,null,null],
        [null,null,null,null,null,null,null,nullbottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,null,null,null,null,null,null],
        [null,null,null,null,null,null,null,null,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,cell,separator,null,null,null,null,null,null],
        [null,null,null,null,null,null,null,null,left,space,top,space,top,space,top,space,top,space,top,space,top,space,right,null,null,null,null,null,null],
        [null,null,null,null,null,null,null,null,null,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,space,bottom,null,null,null,null,null,null,null]
]).

display_board([L1|LS]):-
  display_line(L1),nl,display_board(LS).

display_board([]):-nl.

display_line([E1|ES]):-
  traduz(E1,V),
  write(V),
  display_line(ES).

display_line([]):-write('').

% TODO: when writing to the console, the space space is not being written
traduz(cell     ,'   ').
traduz(null     ,'   ').
traduz(space    ,'   ').
traduz(bottom   ,' V ').
traduz(top      ,' ^ ').
traduz(left     ,' ` ').
traduz(right    ,' / ').
traduz(separator,' | ').
traduz(E1       ,'').
