% Make a table of the stuff... and do this allllllllll again......
% Apologies for being snarky

clear, clc, close all;

Atomic_Table = table({'Carbon'; 'Helium'; 'Hydrogen'; 'Nitrogen'; 'Oxygen'}, ...
 {'C'; 'He'; 'H'; 'N'; 'O'}, [6;2;1;7;8], [12.001; 4.003; 1.008; 14.007; 15.999], ...
  'VariableNames', {'Name', 'Symbol', 'Atomic_Number', 'Atomic_Mass'});

  fprintf('The atomic mass of Helium is: %3.3f\n', Atomic_Table.Atomic_Mass(2));
  Atomic_Struct= table2struct(Atomic_Table)';
  disp(["The mass of Helium is: ", Atomic_Struct(2).Atomic_Mass])
  Atomic_Celery = table2cell(Atomic_Table);
  disp(["The mass of Helium is:", Atomic_Celery(2,4)]);