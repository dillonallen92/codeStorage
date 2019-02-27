% Approximate e^x via the first script in book, from -3 to 3 with 20 spaces

clear;
x = 1;
eApprox1 = eApprox(x);
exact = exp(x);
expError = (eApprox1 - exact) ./ exact;
fprintf('The mean error of this approximation is %3.6f\n', expError);

function ans = eApprox(x)
    term1 = 1;
    term2 = x;
    term3 = x.^2 / 2;
    term4 = x.^3 / 6;
    ans = term1 + term2 + term3 + term4;
end