function heu = heuristic(Start, Target, Position)
% heuristic - function which calculate three heuristics which are using in
% A* algorithm.

h = distance_a(Start , Position);
g = distance_a(Position , Target);
f = g+h;

heu = [f;g;h];

end