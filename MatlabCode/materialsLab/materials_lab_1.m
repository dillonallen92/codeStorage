% Materials Lab script
% With distance r (to and from the screen) and D (diameter of the circle), calculate 2*Theta
% Theta / 2 is our bragg angle
% Take ratios of the sin(theta)^2 
% Wavelength of e- is a function of voltage (average voltage)

clear, clc, close all

global h
global m
global e

h = 6.626E-34;
m = 9.11E-31;
e = 1.602E-19;

v = 8000;

% Momentum

p = sqrt( 2 * m * e * v);

% Lambda

lambda = h / p ;

fprintf('Momentum is %10.35f\n', p);
fprintf('Wavelength is %10.35f\n', lambda);

% Diameter values

d1 = [.02164 .02087 .02200 .02150];
d2 = [.02509 .02441 .02594 .02515];
d3 = [.03460 .03530 .03477 .03489];
d4 = [.04038 .04219 .04135 .04131];
d5 = [.05683 .05689 .05704 .05692];

% Average the diameters before calculation
d1_avg = sum(d1)/length(d1);
d2_avg = sum(d2) / length(d2);
d3_avg = sum(d3) / length(d3);
d4_avg = sum(d4) / length(d4);
d5_avg = sum(d5) / length(d5);

% Array of diameters

d_avg = [d1_avg, d2_avg, d3_avg, d4_avg, d5_avg];

l = .182;

% calculate sin(2*theta) and then theta itself

for k = 1: (length(d1))
    doubleTheta = atan( d_avg ./ (2*l)).* (180 / pi);
    theta = doubleTheta ./ 2;
end

% Calculate Qi^2 / Q1^2

for k = 1 : (length(d1)-1)
    thetaR = theta*pi / 180;
    qratioSq(k) = (sin( thetaR(k+1) ) ^2) / (sin( thetaR(1))^2);
end

% Calculate the entries for a

for k = 1 : (length(d1))
    if (k == 1)
        a(1) = sqrt(3)* lambda / ( sin(thetaR(1))* 2);
    else
        a(k) = sqrt(3)*sqrt(qratioSq(k-1)) * lambda / (sin(thetaR(k))*2);
    end
end

% Average a and calcualte atomic radius

a_avg = sum(a) / length(a);
fprintf('Average a is: %10.20f nm\n', a_avg*1E9);

atomR = a_avg / (2 * sqrt(2));
fprintf('Atomic Radius is: %10.20f nm\n', atomR*1E9);


