% Fourth approximation in the book

clear, clc, close all;
x = linspace(-3, 3, 20);
n = 4;
k = 0:n;
[ X K ] = meshgrid(x,k);
eX = sum(X.^(K)./factorial(K));
plot(x, eX, 'o', x, exp(x))
title('Matrix Expression approximation for e^x')
legend('Approximation', 'True')