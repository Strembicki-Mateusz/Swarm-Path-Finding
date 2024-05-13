function heu = heuristic(Start, Target, Position)
% heuristic - function which calculate three heuristics which are using in
% A* algorithm.

g = distance_a(Start , Position);
h = distance_a(Position , Target);
f = g+h;

heu = [f;g;h];

end