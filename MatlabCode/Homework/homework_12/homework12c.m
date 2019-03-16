% Functions and abstractions, problem 3_03

clear, clc, close all
[n p] = getData;
x = 0:n;
fx = Binomial(p,n,x);
drawCurve(x, fx, p, n);

% getData function
function [n,p] = getData
    n = input('Input your value for n: ');
    p = input('Input your value for p: ');
end

function f = Binomial(p,n,x)
    binomCoeff = factorial(n) ./ (factorial(x).*factorial(n-x));
    f = binomCoeff.*p.^(x).*(1-p).^(n-x);
end

function drawCurve(x, fx, p, n)
    plot(x,fx)
end