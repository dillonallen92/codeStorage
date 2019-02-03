function homework_4b(a)
    global a;
    global theta;
    theta = -2*pi : pi / 64 : 2*pi;
    disp('This is a function that prints out the value of a table');

    [x,y] = makeLem(a,theta);

    fprintf('     Theta     x (m)       y (m)\n');
    for k = 1 : length(theta)
        fprintf('%9.3f %9.3f %9.3f\n', theta(k), x(k), y(k));
    end

    function [x,y] = makeLem(a, t)
        x = ((a*sqrt(2))*cos(t))./((sin(t)).^2 + 1);
        y = ((a*sqrt(2))*(cos(t).*sin(t)))./((sin(t)).^2 + 1);
        plot(x,y);
        xlabel('x'), ylabel('y'), title('Lemniscate Plot');
    end

end