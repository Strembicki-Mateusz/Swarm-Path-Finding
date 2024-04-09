function exp_array = array(Rows, Columns, Position, Target, CLOSED, h)
% array - function which have to calculate which neighbour is the best to
% move. It contains the position of robot and value of three heuristic
% functions in this way:
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Position_X | Position_Y | h(n) | g(n) | f(n) %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

exp_array = [];
counter = 1;

for i = -1:1:1
    for j = -1:1:1
        if(i ~= j || i ~= 0)
            XY = Position + [i;j];
            if(((Position(1,:)>0) && (Position(1,:)<Rows)) && ((Position(2,:)>0) && ((Position(2,:)<Columns))))
                flag = 1;
                for k = 1:size(CLOSED,1)
                    if((Position == CLOSED(:,k)))
                        flag = 0;
                    end
                end
                if flag == 1
                    exp_array(counter,1) = XY(1,:);
                    exp_array(counter,2) = XY(2,:);
                    exp_array(counste,3) = distance(Position,XY)+h;
                    exp_array(counter,4) = distance(XY,Target);
                    exp_array(counter,5) = heuristic(Position,XY,Target);
                    counter = counter + 1;
                end
            end
        end
    end
end