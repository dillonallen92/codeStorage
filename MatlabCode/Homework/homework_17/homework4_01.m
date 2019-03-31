% This is the first problem in chapter 4
% Make a cell array of the atomic elements presented and then convert to structure array and table.
% After each part, print out helium's mass.

clear, clc, close all;

fieldnames = {'Name', 'Symbol', 'Atomic_Number', 'Atomic_Mass'};
Atomic_Celery = {'Carbon', 'C', 6, 12.01; ...
                 'Helium', 'He', 2, 4.003; ...
                 'Hydrogen', 'H',1, 1.008; ...
                 'Nitrogen', 'N', 7, 14.007; ...
                 'Oxygen', 'O', 8, 15.999};
disp(["The mass of Helium is:", Atomic_Celery(2,4)]);
Atomic_Struct = cell2struct(Atomic_Celery, fieldnames, 2);
disp(["The mass of Helium is: ", Atomic_Struct(2).Atomic_Mass])
Atomic_Table = struct2table(Atomic_Struct);
fprintf('The atomic mass of Helium is: %3.3f\n', Atomic_Table.Atomic_Mass(2));