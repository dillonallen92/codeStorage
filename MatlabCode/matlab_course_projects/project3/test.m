clear, clc, close all;

% Mobius Strip

u = linspace(0, 2*pi, 200);
v = linspace(-2, 2, 200);
[U,V] = meshgrid(u,v);

z = (2+V.*cos(U/2)).*cos(U);
y = (2+V.*cos(U/2)).*sin(U);
x = V.*sin(U/2);

surf(x,y,z, 'FaceAlpha', 0.7)
hold on
% particle path

a = linspace(0,2*pi, 200);
b = linspace(-2,2,200);

pz = (2+b.*cos(a/2)).*cos(a);
py = (2+b.*cos(a/2)).*sin(a);
px = b.*sin(a/2);

plot3(px,py,pz,'LineWidth', 3);