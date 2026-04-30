
% possible moves going up/down in same column
possible_move(X,Y,X,Y2) :-
    number(X,Y,_),
    area(X,Y2,_),
    Y != Y2.

% possible moves going left/right in same row
possible_move(X,Y,X2,Y) :-
    number(X,Y,_),
    area(X2,Y,_),
    X != X2.

1 { target(X,Y,X2,Y2) : possible_move(X,Y,X2,Y2) } 1 :-
    number(X,Y,_).

% vertical path cells between source and target
path_cell(X,Y,X,Y2,X,Z) :-
    target(X,Y,X,Y2),
    cell(X,Z),
    Y < Z,
    Z <= Y2.

path_cell(X,Y,X,Y2,X,Z) :-
    target(X,Y,X,Y2),
    cell(X,Z),
    Y2 <= Z,
    Z < Y.

% horizontal path cells between source and target
path_cell(X,Y,X2,Y,Z,Y) :-
    target(X,Y,X2,Y),
    cell(Z,Y),
    X < Z,
    Z <= X2.

path_cell(X,Y,X2,Y,Z,Y) :-
    target(X,Y,X2,Y),
    cell(Z,Y),
    X2 <= Z,
    Z < X.

#show target/4.