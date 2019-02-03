clear

% define the variables

theta = 0 : pi/32 : 2*pi;

a = 5;
b = 2;
x = a*cos(theta);
y = b*cos(theta);

% cell arrays

Ellipse = { a b theta x y};
printEllipseTable(Ellipse);

% call function to print ellipse

function printEllipseTable(Elps)
    fprintf('The width of the ellipse %.1fm \n', Elps{1});
    fprintf('The height of the Ellipse is %.1fm\n', Elps{2});
    fprintf('     Theta       x           y\n');
    for k = 1 : length(Elps{3})
        fprintf('%10.1f %9.3f %9.3f\n', Elps{3}(k), Elps{4}(k), Elps{5}(k));
    end
end