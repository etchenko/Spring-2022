:- use_module(library(lists)).
% Splitting List
split(N, L, F, B):-
    N = 0, B = L, F = [].
split(N, [H|T], [HF|TF], B):-
    N > 0, N2 is N - 1, HF = H, split(N2, T, TF, B).

% Chopping a List
chop(_N, [], []).
chop(N, L, [H2|T]):-
    split(N, L, H2, L3),
    chop(N, L3, T).
chop(_N, L, [H]):-
    H = L.

% Enumerating sublist
list_sub(L, P, B, Len, A):-
    append([F,P,T], L),
    length(P, Len),
    length(F, B),
    length(T, A).

% First plateau
first_plateau([H1,H2|T], A, Len, Suff):-
    H1 = H2 -> 
       (A = H1, (first_plateau([H2|T], A, Len2, Suff) -> 
                    Len is Len2 + 1; 
                    Len = 2, Suff = T)
        );
        first_plateau([H2|T], A, Len, Suff).

% Enumerate Plateaus
plateau([H1,H2|T], A, Len) :-
    first_plateau([H1,H2|T], A, Len, _Suff); first_plateau([H1,H2|T], _B, _C, Suff), plateau(Suff, A, Len).
