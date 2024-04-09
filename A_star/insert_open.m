function row = insert_open(Start,Neighbour,f)

row = [1,8];
row(1,1) = 1;
row(1,2) = Start(1,:);
row(1,3) = Start(2,:);
row(1,4) = Neighbour(1,:);
row(1,5) = Neighbour(2,:);
row(1,6) = f(1,:);
row(1,7) = f(2,:);
row(1,8) = f(3,:);
end