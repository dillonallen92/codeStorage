% Plotting Code and Display Table

v0 = input("Enter your initial speed (m/s): ");
theta = input('Enter your elevation angle: ');
theta = theta * pi / 180;
g = 9.81; t = 0:0.1:1;
x = v0*cos(theta)*t;
y = v0*sin(theta)*t - .5*g*t.^2;
Table = [t', x', y'];
disp('    ')
disp('    Time (s)    x(m)     y(m)' )
disp( Table )
plot(x,y)
title( 'Position in X vs Y')
xlabel('X position')
ylabel('Y position')