% Homework problem 2.6 in the book
% Write the following function in the book to approximate pi given user input

clear, clc, close all;
format long
n = input('Enter your values of n: ');

k = 0 : n;

piApprox = sum( ( 4 ./ (8.*k+1)  - 2 ./ (8.*k + 4) - 1 ./ (8.*k + 5)  - 1 ./ (8.*k + 6)) .* (1 / 16).^k );
piError = (piApprox - pi) / pi ;

fprintf('Your approximation of pi is %1.20f\n', piApprox);
fprintf('The actual value of pi is %1.20f\n', pi);
fprintf('Your error is %3.20f\n', piError);