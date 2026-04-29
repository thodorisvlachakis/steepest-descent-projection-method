% This function is made in order to get a graph of convergence of the function f as a function of
% iterations while executing a method/algorithm. This function
% needs, as input, the vector F in which we have stored the estimation for the
% minimum of the objective function f in every iteration of the main algorithm. A second input is the number of iterations
% the algorithm has executed. There is no output, it returns a
% plot of f(x1(k), x2(k)) values, where k is the index of iterations and x1, x2 are
% the coordinates of the kth (in the kth iteration) searching point, as a
% function of iterations k.

function ConvergenceOfObjectiveFunction(F, Iterations, figno)
figure(figno);
clf

k=1:Iterations;
scatter(k, F,30, "blue","filled");
xlabel('Iterations');
ylabel('f(x1(k),x2(k))');
title('Graph of convergence of function f(x1,x2) as a function of Iterations');

end