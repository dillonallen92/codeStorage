kp = 3;
kpm = 30;
kmp = 25;
klm = 15;
kl = 1;
f = @(t,y) [(kp*y(1)*(1-y(1)))-(kpm*(y(1)*y(2))); ((kmp*y(1)+y(3))*y(2)*(1-y(2)))-y(2);(klm*(1+tanh(2*y(2)-2)))-(kl*y(3))];
tspan = [0, 25];
xinit = [0.01, 0.05, 0.539];
ode45(f, tspan, xinit)
legend('p(t)', 'm(t)', 'l(t)')