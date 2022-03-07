boring(L, A) :-
    L = [A].

boring([H|T], A) :-
    H = A,
    boring(T, A).

sum([], 0).
sum([H|T], Sum) :-
    sum(T, Recursive_Sum), 
	Sum is Recursive_Sum + H.

same_length([], []).
same_length([_H1|T1], [_H2|T2]) :-
    same_length(T1, T2).

fact(0, F):-
    F = 1.

fact(N, F):-
    N >= 1,
    N1 is N - 1,
    fact(N1, F1),
    F is F1 * N.