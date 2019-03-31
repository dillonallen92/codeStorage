% Solving Problem 4_07
% Add plotting functionality 

classdef Poly

    properties 
        coeff = zeros(1,99);
    end

    methods

        function p = Poly(varargin)
            for k = 1 : nargin
                p.coeff(nargin - k + 1) = varargin{k};
            end
        end

        function disp(p)
            for k = 99:-1:3
                if p.coeff(k)
                    fprintf('%+fx^%d', p.coeff(k), k-1);
                end
            end
            if p.coeff(2)
                fprintf('%+fx', p.coeff(2));
            end
            if p.coeff(1)
                fprintf('%+f', p.coeff(1));
            end
            fprintf("\n");
        end

        function p = plus(p1, p2)
            p = Poly;
            p.coeff = p1.coeff + p2.coeff;
        end

        function p = minus(p1, p2)
            p = Poly;
            p.coeff = p1.coeff - p2.coeff;
        end

        function p = uminus(p1)
            p = Poly;
            p.coeff = -p1.coeff;
        end

        function p = uplus(p1)
            p = Poly;
            p.coeff = p1.coeff;
        end

        function p = mtimes(p1, p2)
            p = Poly;
            for i = 1 : 99
                for j = 1 : 99
                    if p1.coeff(i) && p2.coeff(j)
                        p.coeff(i+j-1) = p.coeff(i+j-1) + p1.coeff(i) * p2.coeff(j);
                    end
                end
            end
        end

        function output = value(p,x)
            output = zeros(1,length(x));
            for k = 1 : 99
                if p.coeff(k)
                    output = output + p.coeff(k) * x.^(k-1);
                end
            end
        end

        function plot(p, a, b)
            x = linspace(a,b); 
            y = value(p, x);
            plot(x,y);
        end

    end

end

