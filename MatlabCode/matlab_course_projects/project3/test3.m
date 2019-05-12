clear, clc, close all;

% Plot spherical harmonics

theta = linspace(-pi/2,pi/2,200);
phi = linspace(0,2*pi,200);
[phi,theta] = meshgrid(phi,theta);

[xm,ym,zm] = sph2cart(phi, theta, real(spherharm(3,2,theta,phi)));

surf(xm,ym,zm)

function YLM = spherharm(l,m,theta,phi)
    plm = legendre(l,cos(theta));
    Plm = reshape(plm(m+1,:,:), size(phi));

    a = (2*l+1)*factorial(l-m);
    b = 4*pi*factorial(l+m);
    c = sqrt(a/b);
    
    YLM = c.*Plm.*exp(1i*m*phi);
end



