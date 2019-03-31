% The amount of annoyance these problems are causing me is 'sodium' high... heh heh heh
% I'll see myself out

clear, clc, close all;

Atomic_Struct = [struct('Name', 'Carbon', 'Symbol', 'C', 'Atomic_Number', 6, 'Atomic_Mass', 12.011)';
                 struct('Name', 'Helium', 'Symbol', 'He', 'Atomic_Number', 2, 'Atomic_Mass', 4.003)';
                 struct('Name', 'Hydrogen', 'Symbol', 'H', 'Atomic_Number', 1, 'Atomic_Mass', 1.001)';
                 struct('Name', 'Nitrogen', 'Symbol', 'N', 'Atomic_Number', 7, 'Atomic_Mass', 14.007)';
                 struct('Name', 'Oxygen', 'Symbol', 'O', 'Atomic_Number', 8, 'Atomic_Mass', 15.999)'
                 struct('Name', 'Sodium', 'Symbol', 'Na', 'Atomic_Number', 11, 'Atomic_Mass', 22.990)'
                 struct('Name', 'Chlorine', 'Symbol', 'Cl', 'Atomic_Number', 17, 'Atomic_Mass', 35.453)'];

disp(["The mass of Sodium is: ", Atomic_Struct(6).Atomic_Mass]);