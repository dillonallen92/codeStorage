% clear the console and saved variables, start with same code as before

clear, clc
v0 = 5; theta = pi/4; g = 9.81;
t = 0:0.1:1;
x = v0*cos(theta)*t;
y = v0*sin(theta)*t - .5*g*t.^2;
Table = [t; x; y];

% writing to a file

file = fopen('Datafile01_10.dat', 'w+');
fprintf(file, ' Time (s)    x (m)   y (m)\n');
fprintf( file, '%10.1f %9.3f %9.3f\n', Table);
fclose(file);

% Read from the file

clear 
file = fopen('Datafile01_10.dat', 'r');
fscanf(file, '  Time (s)    x (m)   y (m)\n');
Table = fscanf(file, '%f %f %f\n', [3, 11]);
fclose(file);

% Print the read data to the screen

fprintf('   Time (s)    x (m)   y (m)\n');
fprintf('%10.1f %9.3f %9.3f\n', Table);