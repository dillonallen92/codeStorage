% Make a structure array of what I did in problem 1... yay...

clear, clc, close all;

Atomic_Struct = [struct('Name', 'Carbon', 'Symbol', 'C', 'Atomic_Number', 6, 'Atomic_Mass', 12.011)';
                 struct('Name', 'Helium', 'Symbol', 'He', 'Atomic_Number', 2, 'Atomic_Mass', 4.003)';
                 struct('Name', 'Hydrogen', 'Symbol', 'H', 'Atomic_Number', 1, 'Atomic_Mass', 1.001)';
                 struct('Name', 'Nitrogen', 'Symbol', 'N', 'Atomic_Number', 7, 'Atomic_Mass', 14.007)';
                 struct('Name', 'Oxygen', 'Symbol', 'O', 'Atomic_Number', 8, 'Atomic_Mass', 15.999)'];


disp(["The mass of Helium is: ", Atomic_Struct(2).Atomic_Mass])
Atomic_Celery = struct2cell(Atomic_Struct)';
disp(["The mass of Helium is:", Atomic_Celery(2,4)]);
Atomic_Table = struct2table(Atomic_Struct);
fprintf('The atomic mass of Helium is: %3.3f\n', Atomic_Table.Atomic_Mass(2));