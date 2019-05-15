clear, clc, close all;

% Bar Chart

fiveYear = [136, 104, 54, 11];

sixYear = [23, 50, 101, 56];

grouping = [fiveYear', sixYear'];

hb = bar(grouping);
    hb(1).BarWidth = 1.0;
    hb(1).FaceColor = 'green';
    hb(1).EdgeColor = 'green';
    hb(2).BarWidth = 1.0;
    hb(2).EdgeColor = 'red';
ha = gca;
    axis([0,5,0,160]);
    ha.XTickLabel = {'Well Below', 'Just Below', 'Within', 'Above'};
    ha.YGrid = 'on';
title('Letter Identification');
xlabel('Levels');
ylabel('Number of Schools');
text(1:length(fiveYear),fiveYear,num2str(fiveYear'),'vert','bottom','horiz', 'right');
text(1:length(sixYear), sixYear, num2str(sixYear'), 'vert', 'bottom', 'horiz', 'left');
legend('Five Year School Entry', 'Six Year Net');