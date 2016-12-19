  place_random_pieces(T,Size,Pieces):-
    place_piece(T,Size,Size,R),
    Pieces > 0,
    Pieces1 is Pieces - 1,
    place_random_pieces(R,Size,Pieces1).
