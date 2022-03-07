% Increment List Function
increment_list([], L):-
    L = [].
increment_list([Head| Tail], [Head1| Tail1]) :-
    Head1 is Head + 1,
    increment_list(Tail, Tail1).

% Positive Elements
pos_elems([], L):-
    L = [].
pos_elems([Head|Tail], [Head1|Tail1]) :-
    pos_elems(Tail, Tail1),
    Head > 0,
    Head1 is Head.
pos_elems([Head|Tail], L) :-
    Head < 1,
    pos_elems(Tail, L).

% Last Element
list_last([B], V):-
    B = V.
list_last([_H|T], V) :-
    list_last(T, V).

% Finding Value in a List
list_element([H| _T], S) :-
    S = H.
list_element([_H| T], S) :-
    list_element(T, S).

% Concatenating Lists
list_concat([],[],L) :- L = [].
list_concat([],[H|T], [H1|T1]) :- H1 = H, list_concat([], T, T1).
list_concat([H|T], [], [H1|T1]) :- H1 = H, list_concat(T, [], T1).
list_concat([H|T],[H1|T1],[H2|T2]) :- H2 = H, list_concat(T, [H1|T1], T2).