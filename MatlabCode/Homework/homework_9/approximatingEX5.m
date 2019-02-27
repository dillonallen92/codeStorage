% Fifth approximation technique and plotting multiple curves
clear, clc, close all;
x = linspace(-3, 3, 20);
n = 4;
k = (0:n);
[X K] = meshgrid(x,k);
eX = cumsum(X.^K ./ factorial(K));
plot(x, eX(1,:), '+-', ...
     x, eX(2,:), 'x-', ...
     x, eX(3,:), '*', ...
     x, eX(4,:), 'o', ...
     x, exp(x));
title('Curves of approximation')
legend('1 Term', '2 Terms', '3 Terms', '4 Terms', 'Exact', 'Location', 'Southeast')