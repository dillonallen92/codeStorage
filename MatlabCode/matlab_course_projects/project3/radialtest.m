clear, clc, close all;

% radial function test

ra0 = linspace(0,20,200);

plot(ra0, RadialEq(2,1, ra0))

function myRad = RadialEq(n,l,ra0)
    a0 = 1;    
    a = (2/(n*a0))^3;
    b = factorial(n-l-1);
    c = 2*n*(factorial(n+l))^3;
    d = sqrt(a*(b/c));
    myRad = d*exp(-ra0/n).*(2*ra0/n).^l.*specialLag((2*l+1),(n-l-1),ra0);
end

function myval = specialLag(n,l,x)
    k = 2*l+1;
    j = n-l-1;
    myval = (-1)^k*ngrad(standardLag(j+k,x),k);
end

function myval = standardLag(j,x)
    myval = exp(x).*ngrad((exp(-x).*x.^j),j);
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