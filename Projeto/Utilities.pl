cleanScreen :- newLine(50), !.


newLine(Number) :-
	newLine(0, Number).

newLine(Line, Limit) :-
	Line < Limit,
	LineInc is Line + 1,
	nl,
	newLine(LineInc, Limit).

newLine(_,_).

getCoordinates(X,Y,MAX_X,MAX_Y,Z,1):-
	write('Y coordinate to place disk'),nl,
	read(Y2),Y1 is Y2-1,Y1<(MAX_Y),
	write('X coordinate to place disk'),nl,
	read(X2),X1 is X2-1,X1<(MAX_X),
	Y is Y1,
	X is X1.


getCoordinates(X,Y,MAX_X,MAX_Y, b, 2):-
	random(0, MAX_Y, Y2),Y1 is Y2,Y1<(MAX_Y),
	random(0, MAX_X, X2),X1 is X2,X1<(MAX_X-Y1),
	Y is Y1,
	X is X1.

getCoordinates(X,Y,MAX_X,MAX_Y,p, 2):-
	write('Y coordinate to place disk'),nl,
	read(Y2),Y1 is Y2-1,Y1<(MAX_Y),
	write('X coordinate to place disk'),nl,
	read(X2),X1 is X2-1,X1<(MAX_X),
	Y is Y1,
	X is X1.

getCoordinates(X,Y,MAX_X,MAX_Y,Z, 3):-
	random(0, MAX_Y, Y2),Y1 is Y2,Y1<(MAX_Y),
	random(0, MAX_X, X2),X1 is X2,X1<(MAX_X-Y1),
	Y is Y1,
	X is X1.
