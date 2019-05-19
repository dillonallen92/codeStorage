% Project 3
% Goal:
% The goal of this project is to plot the wavefunction solutions to the
% schrodinger equation for the hydrogen atom. The square of the 
% wavefunctions becomes the probability density function that describes
% the probability of finding an electron in the orbital defined by the 
% quantum numbers n, l, m.
% Authors: 
% Dillon Allen and Ana Delgado

clear, clc, close all;

% hydrogen wavefunction plot

ra0 = linspace(0,10, 100);

% Prep the spherical harmonics

theta = linspace(0,2*pi, 100);
phi = linspace(-pi/2,pi/2, 100);
[phi,theta] = meshgrid(phi,theta);

psiPlot = menu('Choose from these quantum numbers', ...
    'n = 3, l = 2, m = 0', 'n = 3, l = 2, m = 1', 'n = 2, l = 1, m = 1',...
    'n = 3, l = 1, m = 0');

switch psiPlot
      case 1
          createPsiAndPlot(3,2,0,ra0,theta,phi);
      case 2
          createPsiAndPlot(3,2,1,ra0,theta,phi);
      case 3
          createPsiAndPlot(2,1,1,ra0,theta,phi);
      case 4
          createPsiAndPlot(3,1,0,ra0,theta,phi);
end

% n = input('What quantum number n do you want?');
% l = input('What quantum number l do you want?');
% m = input('What quantum number m do you want?');
% 
% createPsiAndPlot(n,l,m,ra0, theta, phi);


% functions

function createPsiAndPlot(n,l,m,ra0,theta,phi)
    psi = RadialEq(n,l, ra0).*spherharm(l,m,theta,phi);

    % Plotting

    [xm,ym,zm] = sph2cart(phi, theta, real(psi));

    surf(xm,ym,zm, 'FaceAlpha', 0.4);

    title("$\psi\left(r,\theta,\phi\right)$ Hydrogen wavefunction", 'interpreter', ...
        'latex', 'FontSize',11, 'FontWeight', 'bold', 'Color', '#000000', 'FontName','Times');

    % Plot customizations

    s.EdgeColor = 'none';
    s.FaceColor = 'interp';
    s.FaceLighting = 'flat';

    ax = gca;
    ax.TickDir = 'out';
    ax.XColor = '#0072BD';
    ax.YColor = '#0072BD';
    ax.ZColor = '#0072BD';

    ax.GridLineStyle = ("-");
    ax.GridAlpha = 0.2;
    ax.FontSize = 10;
    ax.TitleFontWeight = 'bold';
    ax.FontSmoothing = 'on';
    ax.TitleFontSizeMultiplier = 2;


    colormap winter
    xlabel("R_cart", "FontName", 'times', "FontWeight","bold")
    ylabel("Theta_cart", "FontName", 'times', "FontWeight","bold")
    zlabel("Phi_cart", "FontName", 'times', "FontWeight","bold")

    % print -depsc psi310
end

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