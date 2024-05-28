function heu = heuristic_a(Start, Target, Position,a)
% heuristic_a - function which calculate three heuristics which are using in
% A* algorithm with additional defining parameter 'a'.

g = distance_a(Start , Position);
h = distance_a(Position , Target);
f = (1-a)*g+a*h;

heu = [f;g;h];

end