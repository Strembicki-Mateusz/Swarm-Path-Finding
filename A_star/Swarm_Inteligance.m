clear all;
close all;
clc;

% Rules:
% Obstacle = -1;
% Robots = -2;
% Space = 5;
% Target = 0;

% Number of Robots
N = 1;

% Grid size
Rows = 8;
Columns = 6;

% Start & end point
x_start = randi([1 Rows]);
y_start = 1;
x_end = randi([1 Rows]);
y_end = Columns;

Start = [x_start; y_start];
End = [x_end; y_end];

% Plot the space
Grid = create_grid(Rows, Columns, Start, End, N);
Grid_With_Weights = grid_weights(Rows, Columns, End);

Grid = link_grids(Rows, Columns, Grid, Grid_With_Weights);
            


% START algorithm
Path = a_star(Rows, Columns, Grid, End, Start);
Path(1,:)
size(Path,1)
Grid = -1*ones(Rows,Columns);
for i = 1:size(Path,1)
    Grid(Path(i,1), Path(i,2)) = i;
end

