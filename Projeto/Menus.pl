
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
write(' PLAYER(BLACK) VS PLAYER(WHITE) '),nl,
display_board_top(14),
display_board_top2(14),
board(T),display_board(T,14,0).

% -----------------------------------------------------------------------
% Menu 2 - PLAYER(BLACK) VS CPU(WHITE)
% -----------------------------------------------------------------------

menu(X):-X==2,use_module(library(random)),nl,
write(' PLAYER(BLACK) VS CPU(WHITE) '),nl,
board(T),display_board(T).

% -----------------------------------------------------------------------
% MENU 3 - CPU(BLACK) VS CPU(WHITE)
% -----------------------------------------------------------------------

menu(X):-X==3,use_module(library(random)),nl,
write(' CPU(BLACK) VS CPU(WHITE) '),nl,
board(T),display_board(T).

% -----------------------------------------------------------------------
% Exit GAME
% -----------------------------------------------------------------------

menu(X):-X==4,fail.
