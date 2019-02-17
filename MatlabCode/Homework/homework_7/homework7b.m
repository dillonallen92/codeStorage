% Dillon Allen
% Problem 2_05

a = 1.1;
b = 2.7;

theta = 0 : 360;

p = a*cos(theta*pi/180)+sqrt(b^2 - a * sin(theta*pi/180));

plot(theta, p);
xlabel('Angle (degrees)'), ylabel('Displacement'), title('Displacement of Piston');