% Problem 2.7 in the book
% Create a mesh for the function in the book

clear, clc, close all;
k = 1 : 50;
x = linspace(0,1,30);
y = linspace(0,2,40);
[ X Y K ] = meshgrid(x,y,k);
Z = sum( (32/(4*pi)) * sin(K*pi/4)./K.^2 .* sin(K .* X * pi) .* cos(K .* Y * pi), 3);
mesh(x,y,Z);

% You are awesome buddy! You are speed! kachaow, We must take the ring and throw it in the pits of the spicy water
% of the mountain