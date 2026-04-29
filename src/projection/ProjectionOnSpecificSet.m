% This function finds the projection of a point on a specific set CX ⊆ R^n 
% which is defined by upper and lower bounds for the coordinates of R^n and is given as input. 
% The set CX is a n×2 matrix which includes the constraints for x1 in
% its first row and the constraints for x2 in its second row ,etc.
% Also, the point whose projection is going to be found has to be given as input.
% The function returns the point that is the projection.


function newPoint = ProjectionOnSpecificSet(point,CX)
% The n-coordinates of the newPoint will be computed under the assumption that CX  
% is defined by upper and lower bounds for the coordinates of R^n.

newPoint=zeros;

for i=1:length(point)
    
    if( point(i) <= CX(i,1) )
        newPoint(i)=CX(i,1);

    elseif ( point(i) >= CX(i,2) )
        newPoint(i)=CX(i,2);

    else
        % This means that the i-th coordinate of point already satisfies
        % the constraint for the i-th coordinate.
        newPoint(i)=point(i);

    end

end

% The newPoint has been computed. 

end