
% -----------------------------------------------------------------------
% Main Menu
% -----------------------------------------------------------------------


mainMenu:-nl,nl,
write(' %%%%% %%%%% %   % %%%%% %%%%% %      %%%%% %%%%% %   % '),nl,
write(' %   % %     %%  %   %   %   % %      %   %   %   %   % '),nl,
write(' %%%%% %%%%% % % %   %   %%%%% %      %%%%%   %   %%%%% '),nl,
write(' %     %     %  %%   %   %   % %      %   %   %   %   % '),nl,
write(' %     %%%%% %   %   %   %   % %%%%%% %   %   %   %   % '),nl,
nl,nl,
write('1 - Player vs Player'),nl,nl,
write('2 - Player vs CPU'),nl,nl,
write('3 - CPU vs CPU'),nl,nl,
write('4 - Exit Game'),nl,nl,
write('Please choose an option:'),nl,
read(R),R1 is R,R1<5,menu(R1).



% -----------------------------------------------------------------------
% Menu 1 - PLAYER(BLACK) VS PLAYER(WHITE)
% -----------------------------------------------------------------------

menu(X):-X==1,nl,
%init_matrix(Columns,Rows,Board),
init_matrix(13,7,T),
write(' PLAYER(BLACK) VS PLAYER(WHITE) '),nl,nl,
%display_board(Board,Size+1,InitialIndentation,BooleanForDisplayingTopRow,InitialIndex-1)
display_board(T,14,2,1,0),
replace(T,2,1,p,Z),
display_board(Z,14,2,1,0),
replace(Z,2,1,b,Y),
display_board(Y,14,2,1,0).

% -----------------------------------------------------------------------
% Menu 2 - PLAYER(BLACK) VS CPU(WHITE)
% -----------------------------------------------------------------------

menu(X):-X==2,use_module(library(random)),nl,
init_matrix(13,7,T),
write(' PLAYER(BLACK) VS CPU(WHITE) '),nl,
display_board(T,14,2,1,0).

% -----------------------------------------------------------------------
% MENU 3 - CPU(BLACK) VS CPU(WHITE)
% -----------------------------------------------------------------------

menu(X):-X==3,use_module(library(random)),nl,
init_matrix(13,7,T),
write(' CPU(BLACK) VS CPU(WHITE) '),nl,
display_board(T,14,2,1,0).

% -----------------------------------------------------------------------
% Exit GAME
% -----------------------------------------------------------------------

menu(X):-X==4,fail.
