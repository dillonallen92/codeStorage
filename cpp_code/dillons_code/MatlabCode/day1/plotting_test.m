clear, clc, close all
%% Defining Variables

theta = 0 : pi/52 : 2*pi;
a = 5;
b = 2;
x = a*cos(theta);
y = b*sin(theta);

%% Plot the function

plot(x,y)
axis equal

%% Create the table

Table = [theta; x; y;];

%% Write to the file and clear the workspace

file = fopen('classworkdata4', 'w+');
fprintf(file, '    Theta .   x .   y\n');
fprintf(file, '%9.3f %9.3f %9.3f\n', Table);
clear

%%  Now read the file

file = fopen('classworkdata4', 'r+');
fscanf(file, '    Theta .   x .   y\n');
Table =  fscanf(file, '%f %f %f\n', [3, 65]);
fclose(file);

%% Print the Table out to the console

fprintf(' .    Theta .    x .         y\n');
fprintf('%9.3f %9.3f %9.3f\n', Table);

%% Save binary input output

save('classworkdata4');
clear, clc, close all

%% Butterfly Plot

t = 0 : pi / 64 : 24 * pi;
x = sin(t).*( exp( cos(t) ) - 2 * cos(4*t) + (sin(t / 12)).^5);
y = cos(t).*( exp( cos(t) ) - 2* cos(4*t) + ( sin(t/12)).^5);
plot(x,y)
axis equal