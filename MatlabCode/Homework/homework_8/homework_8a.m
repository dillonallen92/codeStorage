% Dillon Allen
% Summation to approximate pi, with user input for n (counter for sum)
% Use format long

clear, clc, close all
format long
n = input("What value of n do you want to use: ");

k = 1 : n;

piApprox = 4 * sum( (-1).^(k+1) ./ (2*k - 1));
disp(piApprox);
