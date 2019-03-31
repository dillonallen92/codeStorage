% Dillon Allen
% This program is the sort function from the book (3.13) but reworked to sort backwards 

clear, clc, close all;

% Initialize the array and set n to 0
a = []; n = 0;

% Menu to prompt the user
disp('1. Input numbers and sort');
disp('2. Display the list');
disp('3. Search');
disp('4. Save');
disp('5. Load');
disp('6. Quit');

while 1

    % Let user make a choice
    task = input('Enter a task number: ');
    
    % Switch cases
    switch task
        case 1
            while 1
                string = input('Enter a number (or stop): ', 's');
                if strcmpi(string, 'stop')
                    break;
                else
                    n = n + 1;
                    a(n) = str2num(string);
                end
            end
            a = sort(a);
        case 2
            disp(a);
        case 3
            key = input('Enter a key number: ')
            found = search(a, key);
            if found
                disp('[Index = ', num2str(found));
            else
                disp('Not found');
            end
        case 4
            save('mySortFunctionStuff', 'a');
        case 5
            load('mySortFunctionStuff')
            n = length(a);
        case 6
            break
    end
end

% Write the sort function now
function out = sort(a)
    n = length(a);
    for i = n-1 : -1 : 1
        for j = 1:i
            if a(j) < a(j+1)
                tmp = a(j);
                a(j) = a(j+1);
                a(j+1) = tmp;
            end
        end
    end
    out = a;
end

% Write the search function
function found = search(a,key)
    n = length(a);
    low = 1;
    high = n;
    found = 0;
    while low <= high && ~found
        mid = floor((low+high)/2);
        if key == a(mid)
            found = mid;
        elseif key < a(mid)
            high = mid-1;
        else
            low = mid + 1;
        end
    end
end