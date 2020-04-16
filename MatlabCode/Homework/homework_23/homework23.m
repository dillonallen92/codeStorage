x = [0:1000];
y = 5.^(x) .* sin(x) .* cos(x);
plot(x,y)