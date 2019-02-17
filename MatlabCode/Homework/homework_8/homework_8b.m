% Dillon Allen
% Homework 8b
% Problem 2_02 and 2_03
% I wrote functions so I could use 2_02 for 2_03. The elementwise multiplication
% is needed in 03 but not in 02.

% Verify the values of the binomial coefficient

clear, clc, close all

n = input("Enter a value for n: ");
x = input("Enter a value for x (less than n): ");

if (n < x)
    x = input("Enter a value for x that is less than n: ");
else
    myans = binomialCalc(n,x);
    disp(myans);
end



% Plot the binomial coefficient for a given n and p

nplot = input("Enter the n you wish to use for the plot: ");
p = input("Enter the value of p you want to use: ");

xplot = 0: nplot;

plotBinomialDist(nplot, xplot, p);

function biCalc = binomialCalc(n,x)
    biCalc = factorial(n) ./ ( factorial(x) .* factorial(n-x));
end

function plotBinomialDist(nPlot, xPlot, p)
    x = xPlot;
    y = binomialCalc(nPlot, xPlot) .* p.^(xPlot) .* (1-p).^(nPlot - xPlot);
    plot(x,y)
end