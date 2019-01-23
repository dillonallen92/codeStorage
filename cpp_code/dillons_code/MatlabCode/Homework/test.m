c = input('Enter a number for c: ' );
a = input('Enter a number for a (less than c): ');
u = 0 : pi / 36 : 2*pi;
m = length(u);
v = 0 : pi / 36 : 2*pi;
n = length(v);

U = repmat(u, m, 1);
V = repmat(v, n, 1);

X = ( c + a * cos(V)).*cos(U);
Y = ( c + a * cos(V)).*sin(U);
Z = a*sin(V);

surf(X,Y,Z)

daspect([1 1 1])
axis vis3d
