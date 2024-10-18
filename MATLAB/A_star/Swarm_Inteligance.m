clear all;
close all;
clc;

% Number of Robots
N = 1;

% Grid size (Minimum size of column is 5)
Rows = 8;
Columns = 8;

%%
% Create Begining and Target position on the map
BeginingPosition = [];
TargetPosition = [];

i = 1;
j = 1;
while i <= N
    BeginingPosition(i,:) = [randi([1 Rows]) , 1];
    TargetPosition(i,:) = [randi([1 Rows]), Columns];
    if i > 1
        for b = 1:(i-1)
            if ( BeginingPosition(b,1) == BeginingPosition(i,1) ) || ( TargetPosition(b,1) == TargetPosition(i,1) )
                i = i-1;
            end
        end
    end
    i = i+1;
end

%%
% Add obstacles
Number_Obstacles = fix((abs(randi([3 Rows-2]) - randi([2 Columns])) * (Rows) * (Columns) * (abs(randi([Rows-6 Columns-3]) / N))) / N /2 );
if Number_Obstacles > (Rows*Columns)*3/5 || Number_Obstacles < max(Rows,Columns)
    Number_Obstacles = fix((Rows*Columns)*1/4);
end


ObstaclesPosition = [];
i = 1;
while i<= Number_Obstacles
    ObstaclesPosition(i,:) = [randi([1 Rows]), randi([3 Columns-2])];
    if i > 1
        for b = 1:(i-1)
            if (ObstaclesPosition(b,1) == ObstaclesPosition(i,1)) && (ObstaclesPosition(b,2) == ObstaclesPosition(i,2))
                i = i-1;
            end
        end
    end
    i = i+1;
end


%%
% Plot Positions on Grid
figure(1); hold on; grid on;
ax = gca; % current axes
ax.YLim = [0 Rows+1];
ax.XLim = [0 Columns+1];

for i = 1:N
    plot(BeginingPosition(i,2), BeginingPosition(i,1), 'bo');
    plot(TargetPosition(i,2), TargetPosition(i,1), 'go');
end

for i = 1:Number_Obstacles
    plot(ObstaclesPosition(i,2), ObstaclesPosition(i,1), 'ko');
end


%%
% A* algorithm
A_PATH = [];

for s = 1:N
    A_PATH = a_star(Rows, Columns, ObstaclesPosition, TargetPosition(s,:), BeginingPosition(s,:))
end

