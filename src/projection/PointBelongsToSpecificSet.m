% This function returns a logical "true" whether a specific point, which is given as input, belongs
% to a specific set CX, which is also given as input, or "false" otherwise.
% The set CX is a n×2 matrix which includes the constraints for x1 in
% its first row and the constraints for x2 in its second row ,etc (with the
% following form: A≤ x1≤ B, where A,B are some real numbers A<B) and
% represents a subset (with that form) of R^n.


function Answer = PointBelongsToSpecificSet(point,CX)
% we have to check if all the coordinates of the point satisfies the
% constraints given in CX or not.

Answer=true;

for i=1:length(point)
    
if( point(i)< CX(i,1) || point(i)>CX(i,2) )
    Answer=false;

end

if(Answer==false)
    return
end

end

end