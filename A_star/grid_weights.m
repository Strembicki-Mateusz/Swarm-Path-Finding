function weights = grid_weights(rows,columns,end_points)
% grid_weights - this function creates grid with weights for the A*
% algorithm. The weights depend on distance_a from start point to the target.

weights = ones(rows,columns);
for i = 1:rows
    for j = 1:columns
        weights(i,j) = distance_a(end_points, [i;j]);
    end
end


end