clear, clc, close all;

% initial conditions
theta = 30;
g = 9.81;
v0 = 20;
x(1) = 0;
y(1) = 0;

i = 1;
t(1) = 0;

while(y(i) >= 0)
    x(i+1) = x(i) + v0*cosd(theta)*t(i);
    y(i+1) = y(i) + v0*sind(theta)*t(i) - 0.5*g*t(i)^2;
    t(i+1) = t(i) + 0.01;
    i = i + 1;
end

plot(t,y, 'LineWidth',2);
hold on
plot(t,x, 'LineWidth',2);
hold off
grid on
xlabel('time (s)')
ylabel('Distance (m)');
legend('y(t)', 'x(t)')
