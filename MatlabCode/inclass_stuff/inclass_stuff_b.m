clear, clc, close all
% Do the same thing in inclass_stuff, but as a structure now

% define the variables

theta = 0 : pi/32 : 2*pi;

a = 5;
b = 2;
x = a*cos(theta);
y = b*cos(theta);

% cell arrays

Ellipse.width = a;
Ellipse.height = b;
Ellipse.theta = theta;
Ellipse.x = x;
Ellipse.y = y;
printEllipseTable(Ellipse);

% call function to print ellipse

function printEllipseTable(Elps)
    fprintf('The width of the ellipse %.1fm \n', Elps.width);
    fprintf('The height of the Ellipse is %.1fm\n', Elps.height);
    fprintf('     Theta       x           y\n');
    for k = 1 : length(Elps.theta)
        fprintf('%10.1f %9.3f %9.3f\n', Elps.theta(k), Elps.x(k), Elps.y(k));
    end
end


