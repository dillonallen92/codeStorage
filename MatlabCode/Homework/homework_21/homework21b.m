clear, clc, close all;

% Polar Plot

a = 7; b = 2;
theta = linspace(0 ,2*pi, 200);
rplus = sqrt(cos(theta).^2 .* (a*sin(theta).^2 + b));
polar(theta, rplus);

title('polar plot of stuff');

