% Create an array struct that has fieldnames of favMovie, favFood, age, height
% Make 4 people and then print out the ages

clear, clc, close all

peopleArrayStruct(1) = struct('favFood', 'Blue Jollyranchers', 'favMovie', 'V for Vendetta',... 
                                                'Age', 21, 'Height', 68);
peopleArrayStruct(2) = struct('favFood', 'Pho', 'favMovie', '500 Days of Summer', ...
                                                'Age', 27, 'Height', 64);
peopleArrayStruct(3) = struct('favFood', 'Tacos', 'favMovie','Babylon 5', 'Age', 33, 'Height', 70);
peopleArrayStruct(4) = struct('favFood', 'Unagi', 'favMovie', 'Forrest Gump', 'Age', 23, 'Height', 65);

% Display all the ages
peopleArrayStruct.Age