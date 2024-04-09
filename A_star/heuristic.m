function heu = heuristic(Start, Target, Position)
% heuristic - function which calculate three heuristics which are using in
% A* algorithm.

g = distance(Start(1,:), Start(2,:), Position(1,:), Position(2,:));
h = distance(Position(1,:), Position(2,:), Target(1,:), Target(2,:));
f = g+h;

heu = [f;g;h];

end