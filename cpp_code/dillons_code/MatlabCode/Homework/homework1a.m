%% Matlab Homework Assignment 1
% Author: Dillon Allen 
% The following code is written as block statements to
% make submission easier. Hope that's okay.

%% Problem 1 
% Graph a parabola, title and label

x = -20:1:20;
y = x.^2;
plot(x,y)
title( ' Parabola Plot ' )
xlabel( ' X - Axis ' )
ylabel( ' Y - Axis ' )

%% Problem 2
% Plot a trig function, title and label

clear, clc, close all;
x = -20:1:20;
z = sin(x);
plot(x, z)
title( ' Trig Plot ' )
xlabel( ' X - Axis ' )
ylabel( ' Y - Axis ' )
%% Problem 3
% Copy an assignment command from Problem 1
% use the length command on its variable.
% Include a comment in the script that states
% what the length comamnd is doing.

clear, clc, close all;
x = -20 : 1 : 20;
fprintf(" The length of this command is %9.3f", length(x))

% This function takes the length of the variable x that
% was stated above in the first block comment.