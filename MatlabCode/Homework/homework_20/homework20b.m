clear, clc, close all;

% Pie Chart of Five Year

fiveYear = [136, 104, 54, 11];
fiveYearLabel = {'Well Below', 'Just Below', 'Within', 'Above'};
for k = 1:length(fiveYear)
    labels{k} = [fiveYearLabel{k}, sprintf(' (%.3f%%)', fiveYear(k)/sum(fiveYear))];
end

h = pie(fiveYear, labels);
title('Five Year School Entry Pie Plot');