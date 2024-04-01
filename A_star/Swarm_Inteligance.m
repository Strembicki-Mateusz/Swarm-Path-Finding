clear all;
close all;
clc;

% Rules:
% Obstacle = -1;
% Robots = 1;
% Space = 5;
% Final_spots = 0;

% Number of Robots
N = 1;

% Grid size
Rows = 8;
Columns = 5;

% Start & end point
x_start = randi([1 Rows]);
y_start = 1;
x_end = randi([1 Rows]);
y_end = Columns;

Start = [x_start; y_start];
End = [x_end; y_end];

% Plot the space
Grid = create_grid(Rows, Columns, Start, End, N)

Grid_With_Weights = grid_weights(Rows, Columns, End)







