% Homework 3a: Plot a lemniscate.
% Task:
% 1. Get user input for variable a
% 2. Place data into table for t, x, y
% 3. Write the data to a file with the proper headers
% 4. Close the file and then clear the workspace
% 5. Print the contents of the file to the screen
% 6. Create blocks in the script before creation of table, writing and printing

%% Clear everything
clear, clc, close all

%% Instantiate variables and populate theta (t), x, and y
a = input('Input your value for a: ');
t = 0 : pi/64 : 2*pi;
x = ((a*sqrt(2))*cos(t))./((sin(t)).^2 + 1);
y = ((a*sqrt(2))*(cos(t).*sin(t)))./((sin(t)).^2 + 1);
plot(x,y)

%% Creating the table
Table = [t, x, y];

%% Write to the file
file = fopen('Datafile', 'w+');
fprintf(file, ' Theta (rad)     x          y\n');
fprintf(file, '%10.3f %9.3f %9.3f\n', Table);
fclose(file);
clear

%%  Read the file and place back into Table
file = fopen('Datafile', 'r');
fscanf(file, ' Theta (rad)     x          y\n');
Table = fscanf(file, '%f %f %f\n');
fclose(file);

%% Print out to the screen
fprintf(' Theta (rad)     x          y\n');
fprintf('%10.3f %9.3f %9.3f\n', Table);


