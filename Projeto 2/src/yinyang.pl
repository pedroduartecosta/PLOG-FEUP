:- include('board.pl').
:- include('utilities.pl').
:- include('logica.pl').
:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- use_module(library(random)).

yinyang(Size):-
  reset_timer,
  TotalSize is Size*Size,
  length(L,TotalSize),
  domain(L,0,1),
  place_random_pieces(L,TotalSize,Size,Size),
  square(L,1,Size,TotalSize),
  connected(L,1,Size,TotalSize),
  labeling([ffc],L),
  display_walls(Size),
  display_board(L,Size,Size,Size),
  print_time,
  fd_statistics.
