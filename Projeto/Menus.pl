
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
% playGame(Board, MAX_X, MAX_Y, PLAYER)
playGame(T,13,7,p,0,1, GAME_END).

% -----------------------------------------------------------------------
% Menu 2 - PLAYER(BLACK) VS CPU(WHITE)
% -----------------------------------------------------------------------

menu(X):-X==2,use_module(library(random)),nl,
init_matrix(13,7,T),
write(' PLAYER(BLACK) VS CPU(WHITE) '),nl,
playGame(T,13,7,p,0,2, GAME_END).
% -----------------------------------------------------------------------
% MENU 3 - CPU(BLACK) VS CPU(WHITE)
% -----------------------------------------------------------------------

menu(X):-X==3,use_module(library(random)),nl,
init_matrix(13,7,T),
write(' CPU(BLACK) VS CPU(WHITE) '),nl,
playGame(T,13,7,p,0,3, GAME_END).

% -----------------------------------------------------------------------
% Exit GAME
% -----------------------------------------------------------------------

menu(X):-X==4,fail.
