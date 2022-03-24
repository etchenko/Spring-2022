:- use_module(library(lists)).
% Insert into ordered list
insert_ord([], E, L) :-
    L = [E].
insert_ord([H1|T1], E, [H2|T2]) :-
    H1 < E, H2 = H1, insert_ord(T1, E, T2);
    H1 = E, T2 = T1, H2 = H1;
    H1 > E, H2 = E, T2 = [H1|T1].

% Build list
length_list(0, []).
length_list(A, [_Head|Tail]) :-
    A > 0, A2 is A - 1, length_list(A2, Tail).

% Element at index
nth1(N, [H|T], E):-
    N = 1, H = E; N > 1, N2 is N - 1, nth1(N2, T, E).

% Splitting List
split(N, L, F, B):-
    N = 0, B = L, F = [].
split(N, [H|T], [HF|TF], B):-
    N > 0, N2 is N - 1, HF = H, split(N2, T, TF, B).

% Superset
pairs(_A, [], []).
pairs(A, [H|T], [H2|T2]):-
    H2 = A-H, pairs(A, T, T2).

helper([], []).
helper([H|T],[H2|T2]):-
    pairs(H,T,H2), helper(T,T2).


pairings([H|T],L):-
    helper([H|T], L2), append(L2, L).

% Left visible
visible_count([],0).
visible_count([_A],1).
visible_count([X,Y|T], C):-
    Y > X, visible_count([Y|T], C0), C is C0 + 1;
    Y =< X, visible_count([X|T], C).

% Left visible but more efficient
visible_count2(L,VC):-
    viscnt(L, 0, 0, VC).

viscnt([], _, VC0, VC) :- VC = VC0.
viscnt([H|T], M0, C0, VC):-
    H > M0 -> M1 = H, C1 = C0 + 1, viscnt(T, M1, C1, VC)
        ; viscnt(T, M0, C0, VC).