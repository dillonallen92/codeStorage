clear, clc, close all;

% Apple

u = linspace(0, 2*pi, 200);
v = linspace(-pi, pi, 200);

[U,V] = meshgrid(u,v);

X = cos(U).*(4+5.5*cos(V));
Y = sin(U).*(4+5.5*cos(V));
Z = (cos(V) + sin(V) - 1).*(1+sin(V)).*log(1- (pi*V)/10)+7.5*sin(V);

surf(X,Y,Z);
title('De Appel');
xlabel('X');
ylabel('Y');
zlabel('Z');
colormap winter;