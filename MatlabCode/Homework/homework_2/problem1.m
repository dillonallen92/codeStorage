clear, clc, close all
c = 12;
a = 7;
u = 0 : pi / 36 : 2*pi;
m = length(u);
v = 0 : pi / 36 : 2*pi;
n = length(v);

U = repmat(u, m, 1);
V = repmat(v', 1, n);

% Note to self
% [U,V] = meshgrid(u,v);
% Does everything repmat would do but do not need to calculate length (it seems)

X = ( c + a * cos(V)).*cos(U);
Y = ( c + a * cos(V)).*sin(U);
Z = a*sin(V);

surf(X,Y,Z)

title('Surface Plot')
xlabel('X')
ylabel('Y')
zlabel('Z')

daspect([1 1 1])
axis vis3d
