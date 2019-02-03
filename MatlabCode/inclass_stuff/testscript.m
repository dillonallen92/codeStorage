% This is a comment 
v0 = 5; theta = pi/4; g = 9.81;
t = 0 : 0.2 : 1;
x = v0 * cos(theta)*t;
y = v0*sin(theta)*t - .5 * g * t.^2;
plot(x,y)
title('Trajectory')
xlabel( "x position" )
ylabel( "y position" )