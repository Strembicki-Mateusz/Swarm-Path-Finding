clear all;
close all;
clc;

% Rules:
% Obstacle = -1;
% Robots = -2;
% Space = 5;
% Target = 0;

% Number of Robots
N = 3;

% Grid size (Minimum size of column is 5)
Rows = 20;
Columns = 15;

x_start = [];
y_start = [];
buffer_start = [];
x_end = [];
y_end = [];
buffer_end = [];


y_end = Columns;

Start = [];
End = [];
% Start & end point
for i = 1:N
    x_start(:,i) = randi([1 Rows]);
    buffer_start(:,1) = x_start(:,i);
    y_start(:,i) = 1;
    for j = 1:size(buffer_start)
        if buffer_start(:,j) == x_start(:,j)
           i = i - 1;
        end
    end
end
for i = 1:N
    x_end(:,i) = randi([1 Rows]);
    buffer_end(:,1) = x_end(:,i);
    y_end(:,i) = Columns;
    for j = 1:size(buffer_end)
        if buffer_end(:,j) == x_end(:,j)
           i = i - 1;
        end
    end
end

Start = [x_start; y_start];
End = [x_end; y_end];


% x_start = randi([1 Rows]);
% y_start = 1;
% x_end = randi([1 Rows]);
% y_end = Columns;


%kolor = ['ro', 'bo', 'go', 'bo', 'm0'];
%figure(1); hold on;

% Plot the space
Grid = create_grid(Rows, Columns, Start, End, N)
Grid_With_Weights = grid_weights(Rows, Columns, End);
Grid = link_grids(Rows, Columns, Grid, Grid_With_Weights);
            

% START algorithm
for i = 1:N
    Path = a_star(Rows, Columns, Grid, End(:,i), Start(:,i));
    k = size(Path,1);
    for j = 1:size(Path,1)
        Grid(Path(j,1), Path(j,2)) = k;
        k = k-1;
    end
end

Grid
