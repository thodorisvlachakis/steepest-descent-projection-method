% This function is made in order to display the sequence of searching
% points (x1,x2), while executing a method/algorithm, in x1-x2 plane. This function
% needs, as input, the 2×k matrix X which has the sequence of x1(k) (first coordinate of searching points for every k)
% as first row and the sequence of x2(k) (second coordinate of searching points for every k)
% as second row, where k is the number of iterations of the algorithm.
% An another input is a specific point x0 which is the exact minimizaton point the algorithm
% approaches to (or tries to approach...). There is no output, it returns a
% plot of x1-x2 plane in order to get a clear picture of what about the 
% convergence of the algorithm to the desired point.


function SequenceOfSearchingPointsInThePlane(X, x0, figno)
figure(figno);
clf

scatter(x0(1),x0(2), 50, "red", "filled",'d');
hold on
scatter(X(1,:) , X(2,:), 20,"green", "filled");
text(X(1,1),X(2,1), '\rightarrow Starting point');
xlabel('x1');
ylabel('x2');
line(X(1,:) , X(2,:));
colororder("green");

legend('Exact Minimization Point','Sequence of searching points','location','northeastoutside');

end