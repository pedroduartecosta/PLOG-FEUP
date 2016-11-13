cleanScreen :- newLine(50), !.


newLine(Number) :-
	newLine(0, Number).

newLine(Line, Limit) :-
	Line < Limit,
	LineInc is Line + 1,
	nl,
	newLine(LineInc, Limit).

newLine(_,_).

listOfMoves(T, X, Y, MAX_X, MAX_Y, [H|TAIL]):-
	X < MAX_X,
	Y < MAX_Y,
	return_value(T, X, Y, R),
	R \= b,
	R \= p,
	X1 is X+1,
	listOfMoves(T, X1, Y, MAX_X, MAX_Y, [[X,Y]|TAIL]).

listOfMoves(T, X, Y, MAX_X, MAX_Y, [H|TAIL]):-
		Y < MAX_Y,
		Y1 is Y+1,
		MAX_X1 is MAX_X-1,
		listOfMoves(T, 0, Y1, MAX_X1, MAX_Y, [H|TAIL]).

listOfMoves(T, X, Y, MAX_X, MAXY, [H|TAIL]).

displayList([]).
displayList([H|TAIL]):-
	displayList2(H),
	displayList(TAIL).


displayList2([H|TAIL]):-
	write(H),
	write(TAIL).

getCoordinates(T,X,Y,MAX_X,MAX_Y,Z,1):-
	listOfMoves(T, 0, 0, MAX_X, MAX_Y, M),
	displayList(M),
	write('Y coordinate to place disk'),nl,
	read(Y2),Y1 is Y2-1,Y1<(MAX_Y),
	write('X coordinate to place disk'),nl,
	read(X2),X1 is X2-1,X1<(MAX_X),
	return_value(T,X1,Y1,R),
	R == null,
	Y is Y1,
	X is X1.


getCoordinates(T,X,Y,MAX_X,MAX_Y, b, 2):-
	random(0, MAX_Y, Y2),Y1 is Y2,Y1<(MAX_Y),
	random(0, MAX_X, X2),X1 is X2,X1<(MAX_X-Y1),
	return_value(T,X1,Y1,R),
	R == null,
	Y is Y1,
	X is X1.

getCoordinates(T,X,Y,MAX_X,MAX_Y,p, 2):-
	listOfMoves(T, 0, 0, MAX_X, MAX_Y, M),
	displayList(M),
	write('Y coordinate to place disk'),nl,
	read(Y2),Y1 is Y2-1,Y1<(MAX_Y),
	write('X coordinate to place disk'),nl,
	read(X2),X1 is X2-1,X1<(MAX_X),
	return_value(T,X1,Y1,R),
	R == null,
	Y is Y1,
	X is X1.

getCoordinates(T,X,Y,MAX_X,MAX_Y,Z, 3):-
	random(0, MAX_Y, Y2),Y1 is Y2,Y1<(MAX_Y),
	random(0, MAX_X, X2),X1 is X2,X1<(MAX_X-Y1),
	return_value(T,X1,Y1,R),
	R == null,
	Y is Y1,
	X is X1.
