clear, clc, close all;

% hydrogen wavefunction plot

ra0 = linspace(0,10, 100);

% Prep the spherical harmonics

theta = linspace(0,2*pi, 100);
phi = linspace(-pi/2,pi/2, 100);
[phi,theta] = meshgrid(phi,theta);

psi = RadialEq(3,1, ra0).*spherharm(1,0,theta,phi);

% Plotting

[xm,ym,zm] = sph2cart(phi, theta, real(psi));

surf(xm,ym,zm);
title("$\psi\left(r,\theta,\phi\right)$ Hydrogen wavefunction", 'interpreter', 'latex');

% Plot customizations

ax = gca;
ax.TickDir = 'out';
ax.FontSize = 10;
ax.TitleFontSizeMultiplier = 2;
colormap winter;
print -depsc psi310
% functions

function YLM = spherharm(l,m,theta,phi)
    if l == 0 && m == 0
        YLM = 1;
    else
        plm = legendre(l,cos(theta));
        Plm = reshape(plm(m+1,:,:), size(phi));

        a = (2*l+1)*factorial(l-m);
        b = 4*pi*factorial(l+m);
        c = sqrt(a/b);

        YLM = (-1)^m*c.*Plm.*exp(1i*m*phi);
    end
end

function myRad = RadialEq(n,l,ra0)   
    a = (2/(n))^3;
    b = factorial(n-l-1);
    c = 2*n*(factorial(n+l));
    d = sqrt(a*(b/c));
    myRad = d*exp(-ra0/n).*(2*ra0/n).^l.*specialLag((2*l+1),(n-l-1),2*ra0/n);
end

function myval = specialLag(n,l,x)
    k = 2*l+1;
    j = n-l-1;
    myval = (-1)^k*ngrad(standardLag(j+k,x),k);
end

function myval = standardLag(j,x)
    myval = exp(x).*ngrad((exp(-x).*x.^j), j);
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