place_random_pieces(_,_,0,UsedPieces):-
  write('fininshed'),nl.



place_random_pieces(T,TotalSize,Pieces,UsedPieces):-
  random(0, TotalSize, Index),
  random(0,2,P),
  \+ member(Index,UsedPieces),
  element(Index,T,P),
  Pieces1 is Pieces - 1,
  place_random_pieces(T,TotalSize,Pieces1,[Index|UsedPieces]).

place_random_pieces(T,TotalSize,Pieces,UsedPieces):-
  place_random_pieces(T,TotalSize,Pieces,UsedPieces).
