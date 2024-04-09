function grid = create_grid(rows,columns,start_points,end_points,N)
% create_grid -> function which creates space with robots, targets and
% obstacles to avoid them and reach the aim ;)

x_start = start_points(1,1);
y_start = start_points(2,1);
x_end = end_points(1,1);
y_end = end_points(2,1);


grid = 5*ones(rows,columns);

for i = 1:length(N)
    grid(x_start,y_start) = -2;
    grid(x_end,y_end) = 0;
end

% Set obstacles
obstacles = ceil((rows*(columns-2)/randi([2 4])) + mod(rows*(columns-2)/randi([3 columns-2]),3));

for i = 1:ceil(obstacles*2/1.5)
    x = randi([1 rows]);
    y = randi([2 columns-1]);
    if grid(x,y) ~= -1
        grid(x,y) = -1;
    end
end

end