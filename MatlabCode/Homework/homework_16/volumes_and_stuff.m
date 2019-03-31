% Create a function that outputs Volume and Surface Area of Spheres, cylinders, and rectangles

clear, clc, close all;

% Well, I do not believe a rectangle has a surface area or volume, so luckily that is just 0
% First, promp the user for the shape, calculation, and variables

disp("Rectangle with length 3 and width 5:");
[SARect, VRect] = myShapeCalc('Rectangle', 3, 5)
disp("Sphere with radius 10: ");
[SASphere, VSphere] = myShapeCalc('Sphere', 10)
disp("Cylinder with radius 2 and height 10: ");
[SACylinder, VCylinder] = myShapeCalc('Cylinder', 2, 10)

function varargout = myShapeCalc(varargin)
    varargout{1} = 0;
    switch varargin{1}
        case 'Rectangle' 
            varargout{1} = 0;
            varargout{2} = 0;
        case 'Sphere'
            if nargin == 2
                r = varargin{2};
                varargout{1} = 4*pi*r^2;
                if nargout == 2
                    varargout{2} = (4/3)*pi*r^3;
                end
            end
        case 'Cylinder'
            if nargin == 3
                r = varargin{2};
                h = varargin{3};
                varargout{1} = 2*pi*r*h + 2*pi*r^2;
                if nargout == 2
                    varargout{2} = pi*r^2*h;
                end
            end
    end
end
