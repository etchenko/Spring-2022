:- use_module(library(lists)).
merge([],[], []).
merge([H|T], L2, [H3|T3]) :-
    H3 = H,
    merge(L2, T, T3).
merge([], [H|T], T2) :- T2 = [H|T].


% This predicate finds the smallest element in the list.
minimum([A], A).
minimum([H,R|T], E) :- minimum([min(H,R)|T], E).

well_hidden(L,E) :-
    append([R, [I], _Suffix], L),
    minimum(R, M),
    I < M,
    E = I.