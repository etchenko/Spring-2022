% Increment Tree
increment_tree(node(L,R), node(L1, R1)) :-
    increment_tree(L, L1),
    increment_tree(R, R1).

increment_tree(leaf(V), leaf(X)) :-
    X is V + 1.

% Rightmost Leaf

tree_rightmost_value(node(_L, R), V) :-
    tree_rightmost_value(R, V).
tree_rightmost_value(leaf(A), V):-
    V is A.

% Tree Depth
tree_depth(leaf(_A), D):-
    D = 0.
tree_depth(node(L, R), D):-
    tree_depth(L, D1),
    tree_depth(R, D2),
    D is max(D1 + 1, D2 + 1).

% Leaf Value
tree_leaf_value(leaf(A), V):-
    V is A.
tree_leaf_value(node(L, R), V):-
    tree_leaf_value(L, V);
    tree_leaf_value(R, V).

% Concat lists
list_concat([],[],L) :- L = [].
list_concat([],[H|T], [H1|T1]) :- H1 = H, list_concat([], T, T1).
list_concat([H|T], [], [H1|T1]) :- H1 = H, list_concat(T, [], T1).
list_concat([H|T],[H1|T1],[H2|T2]) :- H2 = H, list_concat(T, [H1|T1], T2).

% List of Leaf Values
tree_leaves(leaf(V), [Head]):-
    Head is V.
tree_leaves(node(Left, Right), L):-
    tree_leaves(Left, L1),
    tree_leaves(Right, L2),
    list_concat(L1, L2, L).
