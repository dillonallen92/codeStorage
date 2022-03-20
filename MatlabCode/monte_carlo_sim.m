clear, clc, close all;

g0 = 10;
v0 = 20;
t = 0:0.1:10;
y0 = 100;
figure('Name', 'Model');
for theta = 20:5:60
    hold on
    y = y0 + v0*sind(theta)*t - 0.5*g0*t.^2;
    plot(t,y, 'DisplayName',string(theta));
end
grid on;
legend show;