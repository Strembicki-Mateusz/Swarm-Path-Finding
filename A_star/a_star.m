function y = a_star(Rows, Columns, Grid, Target, Start)
% a_start - heart of algorith. It compare values to create optimal way
% with minimal cost which the robot goes to the target.


OPEN = [];
CLOSED = [];
endOPEN = 1;
endCLOSED = 1;
Position = Start;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adding obstacles to the CLOSED list %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:Rows
    for j = 1:Columns
        if Grid(i,j) == -1
            CLOSED(endCLOSED,1) = i;
            CLOSED(endCLOSED,2) = j;
            endCLOSED = endCLOSED + 1;
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adding starting point to the OPEN list %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:Rows
    for j = 1:Columns
        if Grid(i,j) == -2
            fn = heuristic(Start, Target, Position);
            OPEN(endOPEN,:) = insert_open(Start,Position,fn);
            OPEN(endOPEN,1) = 0;
        end
    end
end

endCLOSED = endCLOSED + 1;
CLOSED(endCLOSED,1) = Start(1,:);
CLOSED(endCLOSED,2) = Start(2,:);
PATH = 0;


%%%%%%%%%%%%%%%%%%%
% START ALGOTIRHM %
%%%%%%%%%%%%%%%%%%%
while((Start ~= Target) && (PATH == 0))
    exp_array = array(Rows, Columns, Start, CLOSED, fn(3,:));
    for i = 1:size(exp_array,1)
        flag = 0;
        for j = 1:endOPEN
            if( exp_array(i,3) == OPEN(j,2) ) && ( exp_array(i,4) == OPEN(j,3) )
                OPEN(j,8) = min(OPEN(j,8),exp_array(i,5));
                if (OPEN(j,8) == exp_array(i,5))
                    OPEN(j,4) = Position(1,:);
                    OPEN(j,5) = Position(2,;);
                    OPEN(j,6) = exp_array(i,3);
                    OPEN(j,7) = exp_array(i,4);
                end
            flag = 1;
            end
        end
        if flag == 0
            endOPEN = endOPEN + 1;
            OPEN(endOPEN,:) = insert_open([exp_array(i,1) ; exp_array(i,2)] , Position, [exp_array(i,3) ; exp_array(i,4) ; exp_array(i,5)]);
        end
    end



    % To do %



end

