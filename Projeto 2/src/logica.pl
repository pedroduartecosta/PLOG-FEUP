  place_random_pieces(T,Size,Pieces):-
    placeRandomPiece(T,Size,Size,R),
    Pieces > 0,
    Pieces1 is Pieces - 1,
    place_random_pieces(R,Size,Pieces1).
