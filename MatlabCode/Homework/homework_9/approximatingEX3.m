% third approximation technique in matlab book
clear, clc, close all;
x = 1; n = 4; k = 0:n;
format long
eX = sum(x.^n ./ factorial(k))
exact = exp(x)
expError = (eX - exact) / exact ;
fprintf('The error for this approximation technique is %3.6f\n', expError);