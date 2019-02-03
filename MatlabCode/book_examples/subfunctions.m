% Subfunctions example 1.15

clear, global g
v0 = 5; theta = pi/4; g = 9.81;
t = 0:0.1:1;
[distance, height] = trajectory(v0, theta, t);
printTable(t, distance, height);

% Trajectory Function to handle the calculations, output is [x,y]

function [x,y] = trajectory(v0, angle, time)
    global g
    x = v0*cos(angle)*time;
    y = v0*sin(angle)*time - .5*g*time.^2;
end

% Void function to print the table

function printTable(t, x, y)
    fprintf('   Time (s)    x (m)   y (m)\n');
    for k = 1:length(t)
        fprintf('%10.1f %9.3f %9.3f\n', t(k), x(k), y(k))
    end
end
