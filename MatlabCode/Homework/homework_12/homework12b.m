% Replace switch block in Example03_03b with if statements

clear, clc, close all;

choice = 0;
while choice ~= 5
    choice = menu('Choose a Pizza', 'Cheese', 'Mushroom', 'Sausage', 'Pineapple', 'Quit');
    if choice == 1
        disp('Cheese Pizza $3.99');
    elseif choice == 2
        disp('Mushroom Pizza $3.66');
    elseif choice == 3
        disp('Sausage Pizza $4.22');
    elseif choice == 4
        disp('Pineapple Pizza $2.99');
    else
        disp('Bye!');
    end
end