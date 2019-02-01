clear, clc, close all
global widthbox heightbox
figure('Position', [30, 70, 500, 400]);
axes('Units', 'pixels',...
     'Position', [100,80,250,250]);
axis([-10 10 -10 10]);
xlabel('x(m)');
ylabel('y(m)');
title('Boring Plot');

% ui stuff
uicontrol('Style', 'text', ...
          'String', 'Width in m',...
          'Position', [330,300,200,20]);