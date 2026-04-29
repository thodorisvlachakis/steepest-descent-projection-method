% This function makes the plot of the constraints' set CX on the plane of x1-x2, when the constraints for the coordinates x1 and
% x2 are linear and they form a rectangle. It only needs as input the set
% CX of constraints.


function ShadedSetOfConstraintsOnThePlaneOfx1x2(CX, figno)

figure(figno)
patch([CX(1,1) CX(1,2) CX(1,2) CX(1,1)],[CX(2,1) CX(2,1) CX(2,2) CX(2,2)], 'y', 'FaceAlpha',0.5);
xlim([CX(1,1)-10 CX(1,2)+10]);
ylim([CX(2,1)-10 CX(2,2)+10]);
xlabel('x1');
ylabel('x2');

title('Set X Of Constraints');

end