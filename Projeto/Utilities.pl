cleanScreen :- newLine(20), !.


newLine(Number) :-
	newLine(0, Number).

newLine(Line, Limit) :-
	Line < Limit,
	LineInc is Line + 1,
	nl,
	newLine(LineInc, Limit).

newLine(_,_).

getCoordinates(T,X,Y,MAX_X,MAX_Y,Z,1,DIFFICULTY):-
	write('Y coordinate to place disk'),nl,
	read(Y2),Y1 is Y2-1,Y1<(MAX_Y),
	write('X coordinate to place disk'),nl,
	read(X2),X1 is X2-1,X1<(MAX_X),
	return_value(T,X1,Y1,R),
 	R == null,
	Y is Y1,
	X is X1.


getCoordinates(T,X,Y,MAX_X,MAX_Y, b, 2,1):-
	random(0, MAX_Y, Y2),Y1 is Y2,Y1<(MAX_Y),
	random(0, MAX_X, X2),X1 is X2,X1<(MAX_X-Y1),
	return_value(T,X1,Y1,R),
	R == null,
	Y is Y1,
	X is X1.

getCoordinates(T,X,Y,MAX_X,MAX_Y, b, 2,2):-
	intelligent_coordinates(T, b, 0, 0, RX, RY, MAX_X, MAX_X,MAX_Y, 0, 4, FINAL_X, FINAL_Y, 0),
	return_value(T,RX,RY,R),
	R == null,
	X is RX,
	Y is RY.

getCoordinates(T,X,Y,MAX_X,MAX_Y,p, 2,DIFFICULTY):-
	write('Y coordinate to place disk'),nl,
	read(Y2),Y1 is Y2-1,Y1<(MAX_Y),
	write('X coordinate to place disk'),nl,
	read(X2),X1 is X2-1,X1<(MAX_X),
	return_value(T,X1,Y1,R),
	R == null,
	Y is Y1,
	X is X1.

getCoordinates(T,X,Y,MAX_X,MAX_Y,Z, 3,1):-
	random(0, MAX_Y, Y2),Y1 is Y2,Y1<(MAX_Y),
	random(0, MAX_X, X2),X1 is X2,X1<(MAX_X-Y1),
	return_value(T,X1,Y1,R),
	R == null,
	Y is Y1,
	X is X1.

updateMaxCountFound(X, Y,COUNT, FINAL_X, FINAL_Y, MAX_COUNT_FOUND, M, FX, FY):-
	COUNT > MAX_COUNT_FOUND,
	write('MAX COUNT FOUND:'),
	write(MAX_COUNT_FOUND),
	write(COUNT),nl,
	updateMaxCountFound(X, Y,COUNT, X, Y,COUNT, M, FX, FY).

updateMaxCountFound(X, Y,COUNT, FINAL_X, FINAL_Y, MAX_COUNT_FOUND, M, FX, FY):-
	M = MAX_COUNT_FOUND,
	FX = FINAL_X,
	FY = FINAL_Y,
	write('MAX COUNT: '),
	write(M), nl.

intelligent_coordinates(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
	COUNT < COUNT_MAX,
	X < MAX_X,
	Y < MAX_Y,
	write('AI1'),nl,
	return_value(T,X,Y,R),
	R=PLAYER,
	COUNT1 is COUNT+1,
	updateMaxCountFound(X, Y,COUNT1, FINAL_X, FINAL_Y, MAX_COUNT_FOUND, M, FX, FY),
	write('MAX_COUNT_FOUND  '),
	write(M),nl,
	X1 is X+1,
	write('AI1'),nl,
	intelligent_coordinates(T, PLAYER, X1, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT1, COUNT_MAX, FX, FY, M).

intelligent_coordinates(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
	COUNT < COUNT_MAX,
	X < MAX_X,
	Y < MAX_Y,
	X1 is X+1,
	write('AI2'),
	intelligent_coordinates(T, PLAYER, X1, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, 0, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND).

intelligent_coordinates(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
	COUNT < COUNT_MAX,
	Y < MAX_Y,
	MAX_X1 is MAX_X-1,
	Y1 is Y+1,
	write('AI3'),
	intelligent_coordinates(T, PLAYER, 0, Y1,RX, RY,INITIAL_MAX_X, MAX_X1, MAX_Y, 0, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND).

intelligent_coordinates(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
	MAX_COUNT_FOUND = 0,
	random(0, MAX_Y, Y2),Y1 is Y2,Y1<(MAX_Y),
	random(0, INITIAL_MAX_X, X2),X1 is X2,X1<(INITIAL_MAX_X-Y1),
	RY is Y1,
	write('AI33'),nl,
	RX is X1.

intelligent_coordinates(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
	MAX_COUNT_FOUND = COUNT_MAX,
	return_value(T,FINAL_X+1,FINAL_Y,R),
	R \= p,
	R \= b,
	RX is FINAL_X+1,
	write('AI6'),
	RY is FINAL_Y.

intelligent_coordinates(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
	MAX_COUNT_FOUND = COUNT_MAX,
	X1 is FINAL_X-COUNT_MAX,
	return_value(T,X1,FINAL_Y,R),
	R \= p,
	R \= b,
	RX is X1,
	write('AI7'),
	RY is FINAL_Y.

intelligent_coordinates(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
	MAX_COUNT_FOUND = COUNT_MAX,
	X1 is X+1,
	X1 < MAX_X,
	intelligent_coordinates(T, PLAYER, X1, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, 0, COUNT_MAX, FINAL_X, FINAL_Y, 0).

intelligent_coordinates(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
	MAX_COUNT_FOUND = COUNT_MAX,
	Y1 is Y+1,
	Y1 < MAX_Y,
	intelligent_coordinates(T, PLAYER, X, Y1,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, 0, COUNT_MAX, FINAL_X, FINAL_Y, 0).

intelligent_coordinates(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
	write('AI9'),
	COUNT_MAX > 0,
	MAX_COUNT_FOUND1 is MAX_COUNT_FOUND,
	%intelligent_coordinates_diagonal_right(T, PLAYER, X, Y, RX, RY, INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, Final_X, Final_Y, MAX_C_FOUND),
	%MAX_COUNT_FOUND1 < MAX_C_FOUND,
	COUNT_MAX1 is COUNT_MAX-1,
	intelligent_coordinates(T, PLAYER, 0, 0,RX, RY,INITIAL_MAX_X, INITIAL_MAX_X, MAX_Y, 0, COUNT_MAX1, FINAL_X, FINAL_Y, 0).

intelligent_coordinates(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
	COUNT_MAX = 0,
	random(0, MAX_Y, Y2),Y1 is Y2,Y1<(MAX_Y),
	random(0, INITIAL_MAX_X, X2),X1 is X2,X1<(INITIAL_MAX_X-Y1),
	RY is Y1,
	write('AI4'),
	RX is X1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*intelligent_coordinates_diagonal_right(T, PLAYER, X, Y, RX, RY, INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, Final_X, Final_Y, MAX_COUNT_FOUND):-
	COUNT < COUNT_MAX,
	Y < MAX_Y,
	X < MAX_X,
	return_value(T,X,Y,R),
	R=PLAYER,
	COUNT1 is COUNT+1,
	updateMaxCountFound(X, Y,COUNT1, FINAL_X, FINAL_Y, MAX_COUNT_FOUND, M, FX, FY),
	Y1 is Y+1,
	intelligent_coordinates_diagonal_right(T, PLAYER, X, Y1,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT1, COUNT_MAX, FX, FY, M).

	intelligent_coordinates_diagonal_right(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
		COUNT < COUNT_MAX,
		X < MAX_X,
		Y < MAX_Y,
		Y1 is Y+1,
		intelligent_coordinates_diagonal_right(T, PLAYER, X, Y1,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, 0, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND).

	intelligent_coordinates_diagonal_right(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
		COUNT < COUNT_MAX,
		X < MAX_Y,
		X1 is X+1,
		write('AI3'),
		intelligent_coordinates_diagonal_right(T, PLAYER, X1, 0,RX, RY,INITIAL_MAX_X, MAX_X1, MAX_Y, 0, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND).

	intelligent_coordinates_diagonal_right(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
		MAX_COUNT_FOUND = COUNT_MAX,
		return_value(T,FINAL_X+1,FINAL_Y,R),
		R \= p,
		R \= b,
		RX is FINAL_X+1,
		write('AI6'),
		RY is FINAL_Y.

	intelligent_coordinates_diagonal_right(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
		MAX_COUNT_FOUND = COUNT_MAX,
		Y1 is FINAL_Y-COUNT_MAX,
		return_value(T,FINAL_X,Y1,R),
		R \= p,
		R \= b,
		RX is X1,
		write('AI7'),
		RY is FINAL_Y.

	intelligent_coordinates_diagonal_right(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
		MAX_COUNT_FOUND = COUNT_MAX,
		Y1 is Y+1,
		Y1 < MAX_Y,
		intelligent_coordinates_diagonal_right(T, PLAYER, X1, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, 0, COUNT_MAX, FINAL_X, FINAL_Y, 0).

	intelligent_coordinates_diagonal_right(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
		MAX_COUNT_FOUND = COUNT_MAX,
		X1 is X+1,
		X1 < MAX_X,
		intelligent_coordinates_diagonal_right(T, PLAYER, X, Y1,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, 0, COUNT_MAX, FINAL_X, FINAL_Y, 0).

	intelligent_coordinates_diagonal_right(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
		COUNT_MAX = 0.
*/
	/*intelligent_coordinates(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
		MAX_COUNT_FOUND = COUNT_MAX,
		random(0, MAX_Y, Y2),Y1 is Y2,Y1<(MAX_Y),
		random(0, INITIAL_MAX_X, X2),X1 is X2,X1<(INITIAL_MAX_X-Y1),
		RY is Y1,
		write('AI8'),
		RX is X1.

	intelligent_coordinates(T, PLAYER, X, Y,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, COUNT, COUNT_MAX, FINAL_X, FINAL_Y, MAX_COUNT_FOUND):-
		COUNT_MAX > 0,
		COUNT_MAX1 is COUNT_MAX - 1,
		intelligent_coordinates(T, PLAYER, 0, 0,RX, RY,INITIAL_MAX_X, MAX_X, MAX_Y, 0, COUNT_MAX1, FINAL_X, FINAL_Y, 0):-
	*/
