function grid = create_grid(rows,columns,start_points,end_points,N)
% create_grid -> function which creates space with robots, targets and
% obstacles to avoid them and reach the aim ;)

x_start = start_points(1,:);
y_start = start_points(2,:);
x_end = end_points(1,:);
y_end = end_points(2,:);


grid = 5*ones(rows,columns);

for i = 1:N
    grid(x_start(:,i),y_start(:,i)) = -2;
    grid(x_end(:,i),y_end(i)) = 0;
end

% Set obstacles
obstacles = (rows*(columns-2)/randi([3 columns-2]) + mod(rows*(columns-2)/randi([3 columns-2]),3));

for i = 1:ceil(obstacles*4/3)
    x = randi([1 rows]);
    y = randi([3 columns-2]);
    if grid(x,y) ~= -1
        grid(x,y) = -1;
    end
end

end