:- use_module(library(lists)).
% Splitting List
split(0, L, [], L):-
    N = 0, B = L, F = []. % When N is zero 
split(N, [H|T], [HF|TF], B):-
    N > 0, N2 is N - 1, HF = H, split(N2, T, TF, B). % Otherwise

% Chopping a List
chop(_N, [], []). % Base case
chop(N, L, [H2|T]):-
    split(N, L, H2, L3), % Chop list of correct length
    chop(N, L3, T).
chop(N, L, [H]):-
    length(L, Len), % Chop list of smaller length
    Len < N, Len > 0,
    H = L.

% Enumerating sublist
list_sub(L, P, B, Len, A):-
    append([F,P,T], L), % Combine the sublist
    length(P, Len), % Check the lengths of the sublists
    length(F, B),
    length(T, A).

% First plateau
boring([A], A).
boring([A|T],A) :- boring(T,A).

first_plateau(L, A, Len, Suff):-
    append([_, P, Suff], L), % Split list into before, plateau, and suffix
    boring(P, A), % Make sure the plateau is the same
    length(P, Len), % Check the length
    Len > 1, 
    \+ Suff = [A|_], % Make sure it cannot be extended
    !. % End at first find

% Enumerate Plateaus
plateau(L, A, Len) :-
    first_plateau(L, A, Len, _) % Find the first plateau
    ; first_plateau(L, _, _, Suff), plateau(Suff, A, Len). % Skip the first plateau and find the next ones