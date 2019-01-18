% Circuits Lab Code

clear, clc, close all;

% Data for 2.2k 

volts2k = [0, 1.99, 4.02, 6.05, 8.02, 10.04, 12.09];
currents2k = [0, 0.9, 1.8, 2.7, 3.6, 4.5, 5.5];

% Data for 470

volts470 = [0, 2.02, 3.95, 5.94, 7.96, 9.93, 11.94];
currents470 = [0, 4.1, 8.7, 13, 17.5, 21.9, 26.4];

% Plot both together
fit470 = polyfit(currents470, volts470,1);
fit470poly = polyval(fit470, currents470);
plot(currents470, volts470, 'o', currents470, fit470poly, '-')

hold on

fit2k = polyfit(currents2k, volts2k, 1);
fit2kpoly = polyval(fit2k, currents2k);
plot(currents2k, volts2k, 'o', currents2k, fit2kpoly, '-')
title( ' 470 Ohm and 2.2k Ohm Resistor ' )
xlabel( ' Current (mA) ' )
ylabel( ' Voltage (V) ' )
legend( ' 470 Ohm Raw Data ' , ' 470 Linear Fit ' , ' 2.2k Ohm Raw Data ' , ' 2.2k Linear Fit ' )

% Table for the 470 Ohm linear fit
T = table(currents470', volts470', fit470poly', (volts470 - fit470poly)' ...
, 'VariableNames', {'Currents', 'Volts', 'Fit', 'Error'});

% Write lab data to the file
writetable(T, '470OhmData.csv', 'Delimiter', ','); type '470OhmData.csv';

% Table for the 2.2k Ohm Linear Fit
T2 = table(currents2k', volts2k', fit2kpoly', (volts470 - fit2kpoly)' ...
, 'VariableNames', {'Currents', 'Volts', 'Fit', 'Error'});

% Wrie lab data to file
writetable(T2, '2kOhmData.csv', 'Delimiter', ','); type '2kOhmData.csv';
