% Dillon Allen
% Build a GUI that will show the Epitrochoid and handle user input for a, b, h

clear
global aBox bBox hBox

figure('Position', [30 70 700 600])
axes('Units', 'pixels', 'Position', [50 80 450 450])
axis equal
xlabel('X'), ylabel('Y'), title('Epitrochoid');

uicontrol('Style', 'text', 'String', 'Value for a', 'Position', [500 450 150 20]);
aBox = uicontrol('Style', 'edit', 'String', '5', 'Position', [533, 430, 150, 20]);
uicontrol('Style', 'text', 'String', 'Value for b', 'Position', [500 390 150 20]);
bBox = uicontrol('Style', 'edit', 'String', '5', 'Position', [533, 370 150 20]);
uicontrol('Style', 'text', 'String', 'Value for h', 'Position', [500 330 150 20]);
hBox = uicontrol('Style', 'edit', 'String', '5', 'Position', [533 310 150 20]);
uicontrol('Style', 'pushbutton', 'String', 'Create Epitrochoid', 'Position', ...
          [533 240 150 20], 'Callback', @pushbuttonCallback);

function pushbuttonCallback(pushButton, ~)
    global aBox bBox hBox
    a = str2double(aBox.String);
    b = str2double(bBox.String);
    h = str2double(hBox.String);
    t = 0 : pi / 64 : 2*pi;

    [X Y] = createEpitrochoid(a,b,h);

    comet(X,Y);

    % plot(X,Y, 'r')
    % Comet is a lot cooler to look at

    function [U V] = createEpitrochoid(a,b,h)
        U = (a+b) * cos(t) - h * cos( ((a + b) / b) *t );
        V = (a+b) * sin(t) - h * sin( ((a + b) / b) *t );
    end
end
