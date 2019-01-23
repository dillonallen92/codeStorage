clear, clc, close all
c = input('Enter your value for c: ');
a = input('Enter your value for a (less than c): ');
u = 0 : pi / 36 : 2*pi;
m = length(u);
v = 0 : pi / 36 : 2*pi;
n = length(v);

U = repmat(u, m, 1);
V = repmat(v', 1, n);

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

% Problem 3 wants name and z contents printed out
fprintf('Dillon Allen\n')
Z
