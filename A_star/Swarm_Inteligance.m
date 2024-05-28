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
Rows = 10;
Columns = 10;

x_start = [];
y_start = [];
buffer_start = [];
x_end = [];
y_end = [];
buffer_end = [];


y_end = Columns;

Start = [];
End = [];
j = 1;
% Start & end point
for i = 1:500
    x_start(:,j) = randi([1 Rows]);
    buffer_start(:,j) = x_start(:,j);
    y_start(:,j) = 1;
    for k = 1:size(buffer_start)
        if (buffer_start(:,k) == x_start(:,j)) && (j ~= 1)
            j = j - 1;
        end
    end
    if j == N
        break;
    end
    j = j + 1;
end

j = 1;
for i = 1:500
    x_end(:,j) = randi([1 Rows]);
    buffer_end(:,j) = x_end(:,j);
    y_end(:,j) = Columns;
    for k = 1:size(buffer_end)
        if (buffer_end(:,k) == x_end(:,j)) && (j ~= 1)
            j = j - 1;
        end
    end
    if j == N
        break;
    end
    j = j + 1;
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
%save Grid;
%load Grid;
Grid_With_Weights = grid_weights(Rows, Columns, End);
Grid = link_grids(Rows, Columns, Grid, Grid_With_Weights);
  


%%%%%%%%%%%%%%%%%%%%%%
% START A* algorithm %
%%%%%%%%%%%%%%%%%%%%%%
A_PATH = []; % Matrix which contain all paths for robots
a=1;
for i = 1:N
    Path = a_star(Rows, Columns, Grid, End(:,i), Start(:,i));
    k = size(Path,1);
    for j = 1:size(Path,1)
        % Grid(Path(j,1), Path(j,2)) = k;
        % k = k-1;
        %A_PATH(j,a) = i-(2*N);      % Robot ID
        A_PATH(j,a) = Path(j,1);  % X value of path for robot
        A_PATH(j,a+1) = Path(j,2);  % Y value of path for robot
    end
    %A_PATH(k+1,a) = 0;      % Robot ID
    %A_PATH(k+1,a) = Start(1,i);  % X value of path for robot
    %A_PATH(k+1,a+1) = Start(2,i);  % Y value of path for robot
    a = a+2;
    Grid;
    % display("a");
end
% A_PATH(size(A_PATH,1)+1,1) = 0;
% A_PATH(1,size(A_PATH,2)+2) = 0;

for i = 1:size(A_PATH,1) %rows
    for j = 1:size(A_PATH,2) %columns
        if A_PATH(i,j) == 0
            A_PATH;
            A_PATH(i,j) = A_PATH(i-1,j);
        end
    end
end


%%%%%%%%%%%%%
% Animation %
%%%%%%%%%%%%%
Container = []; 
kolor = ["co " , "mo " , "go " , "ro ", "bo", "yo"];
kolors = ["c--" , "m--" , "g--" , "r--", "b--", "y--"];
%kolor2 = ['c ' , 'm ' , 'g ' , 'r ', 'b', 'y'];
for i = 1:N
    Container(i,1) = i;
    Container(i,2) = Start(1,i);
    Container(i,3) = Start(2,i);
end
Container;



figure(1); hold on; grid on;
ax = gca; % current axes
ax.YLim = [1 Rows+1];
ax.XLim = [1 Columns+1];

for i = 1:Rows
    for j = 1:Columns
        if Grid(i,j) == -1
            plot(j+.5,i+.5,'ko');
        end
        if Grid(i,j) == -2
            plot(j+.5, i+.5, 'bo');
        end
        if Grid(i,j) == 0
            plot(j+.5, i+.5, 'bo');
        end
    end
end

a = size(A_PATH,1);
b=1;
dd = 1;
A_PATH;
pause(1);
for f = 1:N
    plot(A_PATH(:,dd+1)+.5,A_PATH(:,dd)+.5,kolors(f));
    dd = dd+2;
end
h = [];
for i = 1:a
    % pause(2);
    % delete(h(1,:));
    for j = 1:N
        %h(1,j) = plot(Container(j,3)+.5, Container(j,2)+.5, kolor(j)); %, 'MarkerFaceColor', kolor(j));
        %pause(.1);
        
        Container(j,2) = A_PATH(i,b);
        Container(j,3) = A_PATH(i,b+1);
        if i < a
            Container(j,4) = A_PATH(i+1,b);
            Container(j,5) = A_PATH(i+1,b+1);
        end
        Container;
        
        if (A_PATH(i,b) == 0)  || (A_PATH(i,b) == -100)
            Container(j,2) = Start(1,j);
            Container(j,3) = Start(2,j);
        end
        
        for l = 1:N
            if j ~= l
                if (Container(j,4) == Container(l,4)) && (Container(j,5) == Container(l,5))
                    path = A_PATH;
                    A_PATH(i+1,b) = A_PATH(i,b);
                    A_PATH(i+1,b+1) = A_PATH(i,b+1);
                    for g = (i+2):(a+1)
                        A_PATH(g,b) = path(g-1,b);
                        A_PATH(g,b+1) = path(g-1,b+1);
                    end
                    i = i - 1;
                    % a = size(A_APTH(:,1));
                end
            end
        end
        A_PATH;
        if b ~= size(A_PATH,2)
            b = b+2;
        end
        %delete(h);
    end
    b = 1;
    
end

a = size(A_PATH,1);
for i = 1:a
    % pause(2);
    % delete(h(1,:));
    for j = 1:N
        h(1,j) = plot(Container(j,3)+.5, Container(j,2)+.5, kolor(j)); %, 'MarkerFaceColor', kolor(j));
        pause(.1);
        
        Container(j,2) = A_PATH(i,b);
        Container(j,3) = A_PATH(i,b+1);
        if i < a
            Container(j,4) = A_PATH(i+1,b);
            Container(j,5) = A_PATH(i+1,b+1);
        end
        Container;
        
        if (A_PATH(i,b) == 0)  || (A_PATH(i,b) == -100)
            Container(j,2) = Start(1,j);
            Container(j,3) = Start(2,j);
        end
        if b ~= size(A_PATH,2)
            b = b+2;
        end
        %delete(h);
    end
    b = 1;
end




% quick introduction
% choosing enviroment
% (database)
% architecture
% instruction how code works
% optimization
% results (graphs, numbers, tables)
% conclusion (how to improve model, what we can learn about this)







% Wpływ wag (waga w węźle mniejsza od wagi do końca) 
