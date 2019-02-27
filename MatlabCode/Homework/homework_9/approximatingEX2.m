% Approximating e^x, second script

clear;
x = 1; n = 4; eX = 0;

for k = 0 : n
    eX = eX + (x^(k)/factorial(k));
end
eX
exact = exp(x)
expError = (eX - exact) / exact ;
fprintf( 'The error for this is %3.5f\n', expError);


