
% -----------------------------------------------------------------------
% Main Menu
% -----------------------------------------------------------------------


mainMenu:-nl,nl,
write(' ______________________________________________________________________________ '),nl,
write('|                                                                              |'),nl,
write('|                                                                              |'),nl,
write('|                                                                              |'),nl,
write('|    _ \\    ____|    \\  |  __ __|      \\      |          \\     __ __|   |   |  |'),nl,
write('|   |   |   __|       \\ |     |       _ \\     |         _ \\       |     |   |  |'),nl,
write('|   ___/    |       |\\  |     |      ___ \\    |        ___ \\      |     ___ |  |'),nl,
write('|  _|      _____|  _| \\_|    _|    _/    _\\  _____|  _/    _\\    _|    _|  _|  |'),nl,
write('|                                                                              |'),nl,
write('|                                                                              |'),nl,
write('|                                                                              |'),nl,
write('|                              1 - Player vs Player                            |'),nl,
write('|                              2 - Player vs CPU                               |'),nl,
write('|                              3 - CPU vs CPU                                  |'),nl,
write('|                              4 - How To Play                                 |'), nl,
write('|                              5 - Exit Game                                   |'),nl,
write('|                                                                              |'),nl,
write('|                                                                              |'),nl,
write('|______________________________________________________________________________|'),nl,
nl,nl,
write('Please choose an option: '),
read(R),R1 is R,R1<6,menu(R1).



% -----------------------------------------------------------------------
% Menu 1 - PLAYER(BLACK) VS PLAYER(WHITE)
% -----------------------------------------------------------------------

menu(X):-X==1,nl,
%init_matrix(Columns,Rows,Board),
init_matrix(13,7,T),
write(' PLAYER(BLACK) VS PLAYER(WHITE) '),nl,nl,
% playGame(Board, MAX_X, MAX_Y, PLAYER)
playGame(T,13,7,p,0,1, GAME_END, 1,1).

% -----------------------------------------------------------------------
% Menu 2 - PLAYER(BLACK) VS CPU(WHITE)
% -----------------------------------------------------------------------

menu(X):-X==2,use_module(library(random)),nl,
init_matrix(13,7,T),
write(' PLAYER(BLACK) VS CPU(WHITE) '),nl,nl,
write(' Set BOT difficulty(0-easy, 1-hard) '),
read(D), D1 is D, D1 < 2,
playGame(T,13,7,p,0,2, GAME_END,1,D1).
% -----------------------------------------------------------------------
% MENU 3 - CPU(BLACK) VS CPU(WHITE)
% -----------------------------------------------------------------------

menu(X):-X==3,use_module(library(random)),nl,
init_matrix(13,7,T),
write(' CPU(BLACK) VS CPU(WHITE) '),nl,nl,
write(' Set BOT difficulty(0-easy, 1-hard) '),
read(D), D1 is D, D1 < 2,
playGame(T,13,7,p,0,3, GAME_END,1,D).

% -----------------------------------------------------------------------
% MENU 4 - HOW TO PLAY
% -----------------------------------------------------------------------

menu(X):-X==4,
cleanScreen,
write(' ______________________________________________________________________________ '),nl,
write('|                                HOW TO PLAY                                   |'),nl,
write('|                                                                              |'),nl,
write('|                                                                              |'),nl,
write('|                                                                              |'),nl,
write('| Try to make a line of 5 pieces of your colour (or more) to win.              |'),nl,
write('| When yout turn arrives put your piece on the board.                          |'),nl,
write('| First put your X coordinate (column) follow by "."                           |'), nl,
write('| Click "Enter".                                                               |'),nl,
write('| Then put your Y coordinate (line) follow by "."                              |'), nl,
write('| Click "Enter".                                                               |'),nl,
write('|                                                                              |'),nl,
write('|                                                                              |'),nl,
write('|                                                                              |'),nl,
write('| 1 - return                                                                   |'),nl,
write('|                                                                              |'),nl,
write('|                                                                              |'),nl,
write('|______________________________________________________________________________|'),nl,
nl,nl,nl,

read(R), mainMenu.

% -----------------------------------------------------------------------
% Exit GAME
% -----------------------------------------------------------------------

menu(X):-X==5,fail.
