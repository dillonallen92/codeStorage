% Homework 3a: Plot a lemniscate.
% Task:
% 1. Modify the code to save to binary 

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

%% Save to binary
save('DataFile02');

%%  Load the Binary
clear
load('DataFile02');

%% Print out to the screen
fprintf(' Theta (rad)     x          y\n');
fprintf('%10.3f %9.3f %9.3f\n', Table);


