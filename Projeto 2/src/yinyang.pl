:- include('board.pl').
:- include('utilities.pl').
:- include('logica.pl').
:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- use_module(library(random)).

yinyang(Size):-
  TotalSize is Size*Size,
  default_board(L),
  domain(L,0,1),
  square(L,1,Size,TotalSize),
  connected(L,1,Size,TotalSize,40),
  labeling([],L),
  display_board(L,Size,Size,Size).


square(L,Index,Size,TotalSize):-
  ceiling(Index/Size) < Size,
  (Index - (floor(Index/Size)*Size)) < Size,
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

connected(L,Index,Size,TotalSize,Visited):-
  \+member(Index,Visited),
  Index \= TotalSize,
  Index1 is Index + 1,
  Index2 is Index + Size,
  Index3 is Index - 1,
  Index4 is Index - Size,
  ceiling(Index/Size) < Size,
  (Index - (floor(Index/Size)*Size)) < Size,
  ceiling(Index/Size) > 1,
  (Index - (floor(Index/Size)*Size)) > 1,
  element(Index,L,A),
  element(Index1,L,B),
  element(Index2,L,C),
  element(Index3,L,D),
  element(Index4,L,E),
  (A#=B, connected(L,Index1,Size,TotalSize,[Index,Visited]))  #\/
  (A#=C, connected(L,Index2,Size,TotalSize,[Index,Visited])) #\/
  (A#=D, connected(L,Index3,Size,TotalSize,[Index,Visited])) #\/
  (A#=E, connected(L,Index4,Size,TotalSize,[Index,Visited])).

connected(L,Index,Size,TotalSize,Visited):-
  \+member(Index,Visited),
  Index \= TotalSize,
  Index1 is Index + 1,
  Index2 is Index + Size,
  Index3 is Index - 1,
  ceiling(Index/Size) < Size,
  (Index - (floor(Index/Size)*Size)) < Size,
  (Index - (floor(Index/Size)*Size)) > 1,
  element(Index,L,A),
  element(Index1,L,B),
  element(Index2,L,C),
  element(Index3,L,D),
  (A#=B, connected(L,Index1,Size,TotalSize,[Index,Visited]))  #\/
  (A#=C, connected(L,Index2,Size,TotalSize,[Index,Visited])) #\/
  (A#=D, connected(L,Index3,Size,TotalSize,[Index,Visited])).


connected(L,Index,Size,TotalSize,Visited):-
  \+member(Index,Visited),
  Index \= TotalSize,
  Index1 is Index + 1,
  Index2 is Index + Size,
  Index4 is Index - Size,
  ceiling(Index/Size) < Size,
  (Index - (floor(Index/Size)*Size)) < Size,
  ceiling(Index/Size) > 1,
  element(Index,L,A),
  element(Index1,L,B),
  element(Index2,L,C),
  element(Index4,L,E),
  (A#=B, connected(L,Index1,Size,TotalSize,[Index,Visited]))  #\/
  (A#=C, connected(L,Index2,Size,TotalSize,[Index,Visited])) #\/
  (A#=E, connected(L,Index4,Size,TotalSize,[Index,Visited])).

connected(L,Index,Size,TotalSize,Visited):-
  \+member(Index,Visited),
  Index \= TotalSize,
  Index1 is Index + 1,
  Index3 is Index - 1,
  Index4 is Index - Size,
  (Index - (floor(Index/Size)*Size)) < Size,
  ceiling(Index/Size) > 1,
  (Index - (floor(Index/Size)*Size)) > 1,
  element(Index,L,A),
  element(Index1,L,B),
  element(Index3,L,D),
  element(Index4,L,E),
  (A#=B, connected(L,Index1,Size,TotalSize,[Index,Visited]))  #\/
  (A#=D, connected(L,Index3,Size,TotalSize,[Index,Visited])) #\/
  (A#=E, connected(L,Index4,Size,TotalSize,[Index,Visited])).


connected(L,Index,Size,TotalSize,Visited):-
  \+member(Index,Visited),
  Index \= TotalSize,
  Index1 is Index + 1,
  Index2 is Index + Size,
  Index3 is Index - 1,
  Index4 is Index - Size,
  ceiling(Index/Size) < Size,
  ceiling(Index/Size) > 1,
  (Index - (floor(Index/Size)*Size)) > 1,
  element(Index,L,A),
  element(Index2,L,C),
  element(Index3,L,D),
  element(Index4,L,E),
  (A#=C, connected(L,Index2,Size,TotalSize,[Index,Visited])) #\/
  (A#=D, connected(L,Index3,Size,TotalSize,[Index,Visited])) #\/
  (A#=E, connected(L,Index4,Size,TotalSize,[Index,Visited])).


connected(L,Index,Size,TotalSize,Visited):-
  \+member(Index,Visited),
  Index \= TotalSize,
  Index1 is Index + 1,
  Index2 is Index + Size,
  ceiling(Index/Size) < Size,
  (Index - (floor(Index/Size)*Size)) < Size,
  element(Index,L,A),
  element(Index1,L,B),
  element(Index2,L,C),
  (A#=B, connected(L,Index1,Size,TotalSize,[Index,Visited]))  #\/
  (A#=C, connected(L,Index2,Size,TotalSize,[Index,Visited])).


connected(L,Index,Size,TotalSize,Visited):-
  \+member(Index,Visited),
  Index \= TotalSize,
  Index1 is Index + 1,
  Index2 is Index + Size,
  Index3 is Index - 1,
  ceiling(Index/Size) < Size,
  (Index - (floor(Index/Size)*Size)) > 1,
  element(Index,L,A),
  element(Index2,L,C),
  element(Index3,L,D),
  (A#=C, connected(L,Index2,Size,TotalSize,[Index,Visited])) #\/
  (A#=D, connected(L,Index3,Size,TotalSize,[Index,Visited])).


connected(L,Index,Size,TotalSize,Visited):-
  \+member(Index,Visited),
  Index \= TotalSize,
  Index1 is Index + 1,
  Index4 is Index - Size,
  (Index - (floor(Index/Size)*Size)) < Size,
  ceiling(Index/Size) > 1,
  element(Index,L,A),
  element(Index1,L,B),
  element(Index4,L,E),
  (A#=B, connected(L,Index1,Size,TotalSize,[Index,Visited]))  #\/
  (A#=E, connected(L,Index4,Size,TotalSize,[Index,Visited])).


connected(L,Index,Size,TotalSize,Visited):-
  \+member(Index,Visited),
  Index \= TotalSize,
  Index1 is Index + 1,
  Index3 is Index - 1,
  Index4 is Index - Size,
  ceiling(Index/Size) > 1,
  (Index - (floor(Index/Size)*Size)) > 1,
  element(Index,L,A),
  element(Index3,L,D),
  element(Index4,L,E),
  (A#=D, connected(L,Index3,Size,TotalSize,[Index,Visited])) #\/
  (A#=E, connected(L,Index4,Size,TotalSize,[Index,Visited])).


connected(_,_,_,_).
