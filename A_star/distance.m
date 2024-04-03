function dis = distance(node, xy)
% distance - function which calculate Manchattan value of the next step in
% grid for robot to reach target.

x_node = node(1,1);
y_node = node(2,1);
x = xy(1,1);
y = xy(2,1);

dis = abs(x_node - x) + abs(y_node-y);