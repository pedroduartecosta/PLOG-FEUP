:- include('Menus.pl').
:- include('Utilities.pl').
:- include('Board.pl').
:- include('Logica.pl').


%--------------------------------%
%----- Pentalath in ProLog ------%
%--------------------------------%
%------- write pentalath. -------%
%---- in the terminal to run ----%
%--------------------------------%
%--------------------------------%


pentalath :-
	cleanScreen,
	mainMenu.
