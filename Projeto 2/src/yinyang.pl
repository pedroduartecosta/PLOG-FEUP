:- include('board.pl').
:- include('utilities.pl').

yinyang:-
  use_module(library(random)),
  %init_matrix(length X, length_Y, Board)
  init_board(6,6,T),
  display_board(R,6).
