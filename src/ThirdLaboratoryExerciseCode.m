% Third Laboratory Exercise

addpath(genpath(pwd));

% I am going to plot the function f(x1,x2) I want to minimize. I will plot
% it for x∈ [-25, 25] and y∈ [-25, 25] in order to get a clear picture of the function
% when x=(x1,x2) belongs to a larger set ehich includes the set X of the
% constraints imposed in the following questions.

% Definition of the function f(x1,x2)
syms x1 x2;

f(x1,x2)= (1/3)*(x1.^2) + 3*(x2.^2) ;

figno=1;
figure(figno);
clf

fsurf(f, [-25 25 -25 25]);
xlabel('x1');
ylabel('x2');
zlabel('f(x1,x2)');
title('Function f(x1,x2)');

%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
% 1. Steepest Descent Method

% As we have plotted the objective function f, it is clear that (0,0) is 
% the minimization point of the function and that's we seek.

% We will execute the "Steepest Descent Method" algorithm starting from a
% random point x0≠(0,0) and getting four different constant values for the
% descent step g (i.e. four different cases). 

% We define the accuracy of the estimation and the starting point x0. We
% choose as starting point anything is not equal to (0,0).
e=0.001;
x0=[7 -4.5];

% i) First subcase: g=0.1 .
g=0.1;

fprintf('\n');
fprintf('Steepest Descent Method: The starting point is the point (%f , %f) .\n',x0(1), x0(2));
fprintf('Execution of Steepest Descent Method with constant descent step g=%f for every iteration.\n',g);
fprintf('\n');

[MinimumValue, MinimizationPoint, F, X, Iterations] = SteepestDescentMethodWithConstantDescentStep (f,x0,e,g);

fprintf('The algorithm is executed for %d Iteration(s) ending up at the point (%.10f , %.10f) .\n',Iterations, MinimizationPoint(1), MinimizationPoint(2));
fprintf('So, the estimation for the Minimization Point is: (x1*,x2*)=(%.10f , %.10f) and for the Minimum Value of the function f is: f(x1*,x2*)=%.10f .\n',MinimizationPoint(1), MinimizationPoint(2), MinimumValue);


% x1-x2 plane: plotting the sequence of searching points during algorithm's
% execution.
figno=figno+1;
SequenceOfSearchingPointsInThePlane(X, [0 0], figno);

% Graph of convergence of the function f as a function of iterations.
figno=figno+1;
ConvergenceOfObjectiveFunction(F,Iterations, figno);



% ii) Second subcase: g=0.3 .
g=0.3;

fprintf('\n');
fprintf('Steepest Descent Method: The starting point is the point (%f , %f) .\n',x0(1), x0(2));
fprintf('Execution of Steepest Descent Method with constant descent step g=%f for every iteration.\n',g);
fprintf('\n');

[MinimumValue, MinimizationPoint, F, X, Iterations] = SteepestDescentMethodWithConstantDescentStep(f,x0,e,g);

fprintf('The algorithm is executed for %d Iteration(s) ending up at the point (%.10f , %.10f) .\n',Iterations, MinimizationPoint(1), MinimizationPoint(2));
fprintf('So, the estimation for the Minimization Point is: (x1*,x2*)=(%.10f , %.10f) and for the Minimum Value of the function f is: f(x1*,x2*)=%.10f .\n',MinimizationPoint(1), MinimizationPoint(2), MinimumValue);


% x1-x2 plane: plotting the sequence of searching points during algorithm's
% execution.
figno=figno+1;
SequenceOfSearchingPointsInThePlane(X, [0 0], figno);

% Graph of convergence of the function f as a function of iterations.
figno=figno+1;
ConvergenceOfObjectiveFunction(F,Iterations, figno);



% iii) Third subcase: g=3 .
g=3;

fprintf('\n');
fprintf('Steepest Descent Method: The starting point is the point (%f , %f) .\n',x0(1), x0(2));
fprintf('Execution of Steepest Descent Method with constant descent step g=%f for every iteration.\n',g);
fprintf('\n');

[MinimumValue, MinimizationPoint, F, X, Iterations]= SteepestDescentMethodWithConstantDescentStep (f,x0,e,g);

fprintf('The algorithm is executed for %d Iteration(s) ending up at the point (%.10f , %.10f) .\n',Iterations, MinimizationPoint(1), MinimizationPoint(2));
fprintf('So, the estimation for the Minimization Point is: (x1*,x2*)=(%.10f , %.10f) and for the Minimum Value of the function f is: f(x1*,x2*)=%.10f .\n',MinimizationPoint(1), MinimizationPoint(2), MinimumValue);


% x1-x2 plane: plotting the sequence of searching points during algorithm's
% execution.
figno=figno+1;
SequenceOfSearchingPointsInThePlane(X, [0 0], figno);

% Graph of convergence of the function f as a function of iterations.
figno=figno+1;
ConvergenceOfObjectiveFunction(F,Iterations, figno);


% iv) Fourth subcase: g=5 .
g=5;

fprintf('\n');
fprintf('Steepest Descent Method: The starting point is the point (%f , %f) .\n',x0(1), x0(2));
fprintf('Execution of Steepest Descent Method with constant descent step g=%f for every iteration.\n',g);
fprintf('\n');

[MinimumValue, MinimizationPoint, F, X, Iterations] = SteepestDescentMethodWithConstantDescentStep(f,x0,e,g);

fprintf('The algorithm is executed for %d Iteration(s) ending up at the point (%.10f , %.10f) .\n',Iterations, MinimizationPoint(1), MinimizationPoint(2));
fprintf('So, the estimation for the Minimization Point is: (x1*,x2*)=(%.10f , %.10f) and for the Minimum Value of the function f is: f(x1*,x2*)=%.10f .\n',MinimizationPoint(1), MinimizationPoint(2), MinimumValue);


% x1-x2 plane: plotting the sequence of searching points during algorithm's
% execution.
figno=figno+1;
SequenceOfSearchingPointsInThePlane(X, [0 0], figno);

% Graph of convergence of the function f as a function of iterations.
figno=figno+1;
ConvergenceOfObjectiveFunction(F,Iterations, figno);



%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
% Before moving on to the next questions, we define the constraints for the
% coordinates x1 and x2 of vector x. We will plot the set CX of the given constraints:  
% -10≤ x1≤ 5 and -8≤ x2 ≤ 12.
% We define the CX as a 2×2 matrix which includes the constraints for x1 in
% its first row and the constraints for x2 in its second row.
CX=[-10 5; -8 12];

figno=figno+1;
ShadedSetOfConstraintsOnThePlaneOfx1x2(CX, figno);


%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
% 2. Steepest Descent Projection Method
% We will execute the "Steepest Descent Projection Method" algorithm starting from the
% point x0=(5,-5) and choosing the descent step g(k)=g=0.5 (i.e constant)
% and the step s(k)=s=5 in every iteration of algorithm. 
% Also, we define the estimation accuracy e=0.01 as requested.
e=0.01;
g=0.5;
s=5;
x0=[5,-5];

% Presentation of "Steepest Descent Projection Method" Algorithm's
% execution.

% Execution.
[MinimumValue, MinimizationPoint, F, X, Iterations] = SteepestDescentProjectionMethodWithConstantDescentStep(f,x0,e,g,s,CX);

% Presentation, update the value of figno.
figno=PresentationOfSteepestDescentMethodExecutionResults(CX,x0,g,s, MinimumValue, MinimizationPoint, F, X, Iterations, figno);


%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
% 3. Steepest Descent Projection Method
% We will execute the "Steepest Descent Projection Method" algorithm starting from the
% point x0=(-5,10) and choosing the descent step g(k)=g=0.1 (i.e constant)
% and the step s(k)=s=15 in every iteration of algorithm. 
% Also, we define the estimation accuracy e=0.01 as requested.
e=0.01;
g=0.1;
s=15;
x0=[-5,10];

% Presentation of "Steepest Descent Projection Method" Algorithm's
% execution.

% Execution.
[MinimumValue, MinimizationPoint, F, X, Iterations] = SteepestDescentProjectionMethodWithConstantDescentStep(f,x0,e,g,s,CX);

% Presentation, update the value of figno.
figno=PresentationOfSteepestDescentMethodExecutionResults(CX,x0,g,s, MinimumValue, MinimizationPoint, F, X, Iterations, figno);



% Now, I will propose a practical way that ensures the convergence of the
% algorithm to the desired minimization point. We choose the descent step g(k)=g=2/3 (i.e constant)
% and the step s(k)=s=1/4 in every iteration of algorithm. That's why we
% want s(k)<1/3 and g(k)*s(k)=1/6. We will execute the "Steepest Descent Projection Method" algorithm starting from the
% same starting point x0=(-5,10) which is feasible and using the same
% e=0.01.
e=0.01;
g=2/3;
s=1/4;
x0=[-5,10];

fprintf('Practical way to ensure the convergence.\n')
fprintf('We just change the values of g(k) and s(k) and we choose constant descent step g=%f and the step s=%f , for every iteration.\n',g,s)

% Execution.
[MinimumValue, MinimizationPoint, F, X, Iterations] = SteepestDescentProjectionMethodWithConstantDescentStep(f,x0,e,g,s,CX);

% Presentation, update the value of figno.
figno=PresentationOfSteepestDescentMethodExecutionResults(CX,x0,g,s, MinimumValue, MinimizationPoint, F, X, Iterations, figno);



%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
% 4. Steepest Descent Projection Method
% We will execute the "Steepest Descent Projection Method" algorithm starting from the
% point x0=(8,-10) and choosing the descent step g(k)=g=0.2 (i.e constant)
% and the step s(k)=s=0.1 in every iteration of algorithm. 
% Also, we define the estimation accuracy e=0.01 as requested.
e=0.01;
g=0.2;
s=0.1;
x0=[8,-10];

% Presentation of "Steepest Descent Projection Method" Algorithm's
% execution.

% Execution.
[MinimumValue, MinimizationPoint, F, X, Iterations] = SteepestDescentProjectionMethodWithConstantDescentStep(f,x0,e,g,s,CX);

% Presentation, update the value of figno.
figno=PresentationOfSteepestDescentMethodExecutionResults(CX,x0,g,s, MinimumValue, MinimizationPoint, F, X, Iterations, figno);
