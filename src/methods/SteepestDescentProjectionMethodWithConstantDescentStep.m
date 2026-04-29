% This function is the implementation of Steepest Descent Projection Method with
% constant descent step g and constant step s(k)=s, in every iteration. This step g has to be given as an
% input of the function. The "Steepest Descent Projection Method" is a
% Projection Method which means that can be used to solve the minimization problem 
% of a function f (objective function) under some constraints (i.e x∈ CX
% where CX is the set that represent the constraints). This method
% (in genereal, every Projection Method..) uses the projection concept in order to avoid the exit from
% the set CX of the constraints under the assumption that the starting
% point x0 is feasible. The step s is needed as input, too. Furthermore,
% the set CX has to be given. We also need, as inputs, the function f we want to minimize,
% the starting point x0 and the constant e which determines 
% the termination of the algorithm. The function returns the final estimation
% for the minimum of f and the point of minimization. Also, the
% function returns a vector F in which we store the estimation for the
% minimum of f in every iteration and a vector X in which we store the
% estimation for the point of minimization in every iteration.


function [MinimumValue, MinimizationPoint, F, X, Iterations] = SteepestDescentProjectionMethodWithConstantDescentStep (f,x0,e,g,s,CX)

k=1;

% I will define two vectors x1,x2 in which i will store the coordinats x1 and
% x2,respectively, in every iteration. 
x1(k)=x0(1);
x2(k)=x0(2);

% I need an array F in which I will store the values of function f in every
% iteration.
F=zeros;


Gradientf=gradient(f);
NormGradientf=norm(Gradientf);


while( NormGradientf(x1(k),x2(k)) >=e )

if(k>100)
    X=[x1;x2];
    F(k)=f(x1(k),x2(k));
    MinimumValue=vpa( f(x1(k),x2(k)) );
    MinimizationPoint=[x1(k),x2(k)];
    Iterations=k;

    disp("The method is not efficient because of too many iterations.");
    return

end

Gradf=Gradientf(x1(k),x2(k));

point1=x1(k)-s(1).*Gradf(1);
point2=x2(k)-s(1).*Gradf(2);

point=[point1 point2];
% We' ve just defined the "Steepest Descent Method" algorithm would
% computed as next searching point. We need the projection on the set CX in
% the current method.


% We will define the a vector z which is used in every (kth) iteration
% in order to declare the feasible direction z-xk in the kth
% iteration. z=PrCX{ xk-s(k)*∇f(xk) } where PrCX is the projection of the point
% xk-s(k)*∇f(xk) on the set CX of constraints. I named 
% xk=[x1(k) x2(k)].
% We define the feasible direction with the name d.
z=ProjectionOnSpecificSet(point,CX);

% We declare the feasible direction.
d=z-[x1(k) x2(k)];

% The next searching poin.
x1(k+1)=x1(k)+(g(1).*d(1));
x2(k+1)=x2(k)+(g(1).*d(2));

F(k)=f(x1(k),x2(k));

k=k+1;

end


F(k)=f(x1(k),x2(k));

Iterations=k;


% I return the vectors x and y creating a 2×k matrix which has x1 as first
% row an x2 as second.
X=[x1;x2];

% I return the final estimations. 
MinimumValue=vpa( f(x1(k),x2(k)) );

MinimizationPoint=[x1(k),x2(k)];


end