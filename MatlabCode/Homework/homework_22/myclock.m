clear, clc, close all;

% Clock test

n = 120; theta = linspace(pi/2, 2*pi + pi/2, n);
a = 1; b = 1;
aX = a*cos(theta); aY = a*sin(theta);


for k = 1:n
    plot(aX, aY);
    hold on
    handX = [0, -aX(k)];
    handY = [0, aY(k)];
    plot(handX, handY);
    Frames(k) = getframe;
    hold off;
end
movie(Frames, 5, 2);
videoObj = VideoWriter('Clock');
open(videoObj);
writeVideo(videoObj, Frames);
close(videoObj);



