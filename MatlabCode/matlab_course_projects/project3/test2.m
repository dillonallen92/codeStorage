clear, clc, close all;

% plotting symbolically
syms x;

x = 0:20;
y = exp(-x).*x.^3;
yprime = gradient(y);
ydoubleprime = gradient(yprime);

myFunTest = ngrad(y,2);

if ydoubleprime == myFunTest
    disp("It worked")
else
    disp("You fucked up");
end

function val = ngrad(myFun, n)
    if n == 1
        val = gradient(myFun);
    else
        newN = n-1;
        myNewFun = gradient(myFun);
        val = ngrad(myNewFun, newN);
    end
end
