rooms([office(_, 5), office(_, 4), office(_, 3), office(_, 2), office(_, 1)]).
adjacent(X,Y) :- X =:= Y+1.
adjacent(X,Y) :- X =:= Y-1. 

layout(X) :- rooms(X),
	     member(office(jim, A),X), A\=5, A\=1,
	     member(office(hunter, B),X), B\=5,
	     member(office(laura, C),X), C\=5, C\=1,
	     \+(adjacent(A,C)),
             member(office(sally, D),X), D\=1, D > C, 	     
	     member(office(jack, E),X),
	     \+(adjacent(A,E)).

