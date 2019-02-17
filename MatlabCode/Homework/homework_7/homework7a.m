% Dillon Allen
% Problem 2_04

alpha = 2E-5;
v = 0.3;
E = 206E9;
Ta = 260;
Tb = 150;
a = 6;
b = 12;

r = 6:12;

sigma_r = ((alpha*E*(Ta - Tb))/(2*(1-v)*log(b/a)))...
    *(((a^2/(b^2 -a^2))*((b^2./r.^2)-1)*log(b/a))-log(b./r));

sigma_h = ((alpha*E*(Ta - Tb))/(2*(1-v)*log(b/a))) * ((1 - ((a^2/(b^2-a^2))*(b^2./r.^2 + 1)*log(b/a)) - log(b./r)));

plot(r, sigma_r, '--')
hold on
plot(r, sigma_h)
xlabel('Radial Coordinate (mm)'), ylabel('Stress (Pa)'), title('Radial and Hoop Stresses of a Pipe');