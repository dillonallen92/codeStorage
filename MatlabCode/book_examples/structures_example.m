% Structure Example 1.17

clear
v0 = 5; theta = pi/4; g = 9.81;
t = 0 : 0.1 : 1;
x = v0 * cos(theta) * t;
y = v0 * sin(theta) * t - .5*g*t.^2;

% Define the structure and its named fields

Trajectory.velocity = v0;
Trajectory.angle = theta;
Trajectory.time = t;
Trajectory.distance = x;
Trajectory.height = y;
printTrajectory(Trajectory)

% printTrajectory 

function printTrajectory(Traj)
    fprintf('Initial velocity = %.0f m/s \n', Traj.velocity)
    fprintf('Elevation angle = %.0f degrees \n', Traj.angle * 180 / pi)
    fprintf('   Time (s)    x (m)   y (m) \n')
    for k = 1 : length(Traj.time)
        fprintf('%10.1f %9.3f %9.3f\n', Traj.time(k), Traj.distance(k), Traj.height(k))
    end
end