function grid = link_grids(Rows, Columns, Grid, Grid_With_Weights)

for i = 1:Rows
    for j = 1:Columns
        if ((Grid(i,j) ~= -1) & (Grid(i,j) ~= -2) & (Grid(i,j) ~= 0))
            Grid(i,j) = Grid_With_Weights(i,j);
        end
    end
end

grid = Grid;
