% This function is used in order to give a a presentation of the results
% taken by executing the "Steepest Descent Projection Method" Algorithm.
% It just gives a presentation of the results and makes
% the necessary graphs. This function needs, as inputs, 
% The output is declared in order to have a "counter" for number of figures
% in case of there are too many figures in the main program.

function figno = PresentationOfSteepestDescentMethodExecutionResults(CX,x0,g,s, MinimumValue, MinimizationPoint, F, X, Iterations, figno)

fprintf('\n');
fprintf('Steepest Descent Projection Method: The starting point is the point (%f , %f) .\n',x0(1), x0(2));
fprintf('The constraints that have been set for the coordinates x1 and x2 are: %f≤ x1≤ %f and %f≤ x2≤ %f .\n', CX(1,1), CX(1,2), CX(2,1), CX(2,2) );
if(PointBelongsToSpecificSet(x0,CX)==false)
    fprintf('The point (%f , %f) does not belong to the set of constraints, so this is not a feasible point.\n',x0(1), x0(2) );
    fprintf('So, the method does not ensure the convergence to the desired point.\n');
end
fprintf('Execution of Steepest Descent Projection Method with constant descent step g=%f for every iteration. Also the step s=%f for every iteration.\n',g,s);
fprintf('\n');

% We add the message the algorithm "Steepest Descent Projection Method" returns in case of too many iterations.
if(Iterations>100)
    fprintf('The method is not efficient because of too many iterations.\n');

end

fprintf('The algorithm is executed for %d Iteration(s) ending up at the point (%.10f , %.10f) .\n',Iterations, MinimizationPoint(1), MinimizationPoint(2));
fprintf('So, the estimation for the Minimization Point is: (x1*,x2*)=(%.10f , %.10f) and for the Minimum Value of the function f is: f(x1*,x2*)=%.10f .\n',MinimizationPoint(1), MinimizationPoint(2), MinimumValue);

% x1-x2 plane: plotting the sequence of searching points during algorithm's
% execution.
figno=figno+1;
SequenceOfSearchingPointsInThePlane(X, [0 0], figno);
legend('AutoUpdate','off');
ShadedSetOfConstraintsOnThePlaneOfx1x2(CX, figno);
title('');

% Graph of convergence of the function f as a function of iterations.
figno=figno+1;
ConvergenceOfObjectiveFunction(F,Iterations, figno);


end