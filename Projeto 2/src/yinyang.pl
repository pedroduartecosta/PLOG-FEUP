:- include('board.pl').
:- include('utilities.pl').
:- include('logica.pl').
:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- use_module(library(random)).

yinyang(Size):-
  TotalSize is Size*Size,
  length(L,TotalSize),
  domain(L,0,1),
  place_random_pieces(L,TotalSize,Size,TotalSize),
  square(L,1,Size,TotalSize),
  connected(L,1,Size,TotalSize),
  labeling([],L),
  display_board(L,Size,Size,Size).


square(L,Index,Size,TotalSize):-
  Index \= TotalSize,
  element(Index,L,A),
  Index1 is Index + 1,
  element(Index1,L,B),
  Index2 is Index+Size,
  element(Index2,L,C),
  Index3 is Index2+1,
  element(Index3,L,D),
  sum([A,B,C,D],#\=,0),
  sum([A,B,C,D],#\=,4),
  square(L,Index1,Size,TotalSize).
square(_,_,_,_).

connected(L,1,Size,TotalSize):-
  Index \= TotalSize,
  element(Index,L,A),
  Index1 is Index + 1,
  element(Index1,L,B),
  Index2 is Index + Size,
  element(Index2,L,C),
  Index3 is Index - 1,
  element(Index3,L,D),
  Index4 is Index - Size,
  element(Index4,L,E),
  (A#=B #\/ A#=C #\/ A#=D #\/ A#=E),
  connected(L,Index1,Size,TotalSize).
connected(_,_,_,_).
