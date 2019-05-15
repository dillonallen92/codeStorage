clear, clc, close all;

% 5.1 plot 3d curve

r = 0.3; n = 5; P = 3;
eta = linspace(0, 2*n*pi, 200);
phi = linspace(0, 2*pi, 200);

x = (1-r*cos(phi)).*cos(eta);
y = (1-r*cos(phi)).*sin(eta);
z = r*(sin(phi) + (P*eta/pi));

plot3(x,y,z);
title('3D Plot');
xlabel('x');
ylabel('y');
zlabel('z');