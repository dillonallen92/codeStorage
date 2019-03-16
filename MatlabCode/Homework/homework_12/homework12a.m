% Rewrite example03_04b using while-loops instead of for-loops

clear;
x = linspace(0,1,30);
y = linspace(0,1,40);
[X , Y] = meshgrid(x,y);
Phi = zeros(40,30);

% For loop implementation

% for i = 1:40
%     for j=1:30
%         for k=1:20
%             Phi(i,j) = Phi(i,j) + 4*(1-cos(k*pi))/(k*pi)^3 ...
%             *exp(-k*X(i,j)*pi)*sin(k*Y(i,j)*pi);
%         end
%     end
% end

% While loop implementation

k = 1;
 while k <= 20
    Phi= Phi + 4*(1-cos(k*pi))/(k*pi)^3 ...
    *exp(-k*X.*pi).*sin(k*Y*pi);
     k = k + 1;
 end

surf(x,y,Phi)
xlabel('\itx')
ylabel('\ity')
zlabel('\phi(\itx\rm, \ity\rm)')