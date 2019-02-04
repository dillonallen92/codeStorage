% Plot an epitrochoid and print a table of values for an epitrochoid using structures. 
% Create a function to print the table and use the function to print the table.
% Plot the curve. (similar to section 1.16)

clear, clc, close all;

global a b h t;
a = 10;
b = 2; 
h = 4;

t = 0 : pi / 64 : 2*pi;

[X Y] = createEpi(a,b,h,t);
Epitrochoid.t = t;
Epitrochoid.x = X;
Epitrochoid.y = Y;
printEpitrochoid(Epitrochoid);

plot(X, Y, 'g', 'linew', 2);
xlabel('x'), ylabel('y'), title('Epitrochoid');
axis equal;

function [U V] = createEpi(a,b,h,t)
    U = (a+b) * cos(t) - h * cos( ((a + b) / b) *t );
    V = (a+b) * sin(t) - h * sin( ((a + b) / b) *t );
end

function printEpitrochoid(Epi)
    fprintf('     t (rads)     X            Y\n');
    for k = 1 : length(Epi.t)
        fprintf('%9.3f %9.3f %9.3f\n', Epi.t(k), Epi.x(k), Epi.y(k));
    end
end