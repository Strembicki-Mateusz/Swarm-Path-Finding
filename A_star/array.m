function [exp_array] = array(Rows, Columns, Position, Target, CLOSED, h)
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
            if (((XY(1,:)>0) && (XY(1,:)<=Rows)) && ((XY(2,:)>0) && ((XY(2,:)<=Columns))))
                flag = 1;
                for k = 1:size(CLOSED,1)
                    if ( (XY(1,:) == CLOSED(k,1)) && (XY(2,:) == CLOSED(k,2)) )
                       flag = 0;
                    end
                end
                if flag == 1
                    fn = heuristic(Position,Target,XY);
                    exp_array(counter,1) = XY(1,:);
                    exp_array(counter,2) = XY(2,:);
                    exp_array(counter,3) = distance_a(Position,XY)+h;
                    exp_array(counter,4) = distance_a(XY,Target);
                    exp_array(counter,5) = fn(3,:);
                    counter = counter + 1;
                end
            end
        end
    end
end