clear, clc, close all
v0 = 5; g = 9.81;
time = 0:0.1:1; n = length(time);
theta = pi/8 : pi/200 : 3*pi/8; m = length(theta);
Time = repmat(time, m, 1);
Theta = repmat(theta', 1, n);
X = v0*cos(Theta).*Time;
Z = v0 * sin(Theta).*Time - .5*g*Time.^2;
surf(X, Theta, Z)
hold on
loyolagreen = 1/255*[0,104,87];
Z = zeros(m,n);
mesh(X, Theta, Z, 'Edgecolor', loyolagreen);
colormap(loyolagreen)
xlabel('Distance (m)')
ylabel('Theta (Rad)')
zlabel('Height (m)')
colorbar
axis vis3d
