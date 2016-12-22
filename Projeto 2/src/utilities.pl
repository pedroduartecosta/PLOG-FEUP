place_random_pieces(_,_,0,UsedPieces).

place_random_pieces(T,TotalSize,Pieces,UsedPieces):-
  random(0, TotalSize, Index),
  random(0,2,P),
  \+ member(Index,UsedPieces),
  element(Index,T,P),
  Pieces1 is Pieces - 1,
  place_random_pieces(T,TotalSize,Pieces1,[Index|UsedPieces]).

place_random_pieces(T,TotalSize,Pieces,UsedPieces):-
  place_random_pieces(T,TotalSize,Pieces,UsedPieces).

reset_timer :- statistics(walltime,_).

print_time :-
	statistics(walltime,[_,T]),
	TS is ((T//10)*10)/1000,
  nl, write('Solution Time: '), write(TS), write('s'), nl, nl.
