% Take in 3 first names and 3 last names, then display without the unnecessary white space

clear, clc, close all;

firstName1 = input('Enter a first name: ', 's');
firstName2 = input('Enter another first name: ', 's');
firstName3 = input('Enter a third first name: ', 's');

firstNameArray = char(firstName1, firstName2, firstName3);

lastName1 = input('Enter a last name: ', 's');
lastName2 = input('Enter another last name: ', 's');
lastName3 = input('Enter the last last name: ', 's');

lastNameArray = char(lastName1, lastName2, lastName3);

for k = 1 : 3
    disp(['The ', num2str(k) , 'st persons name is ', deblank(firstNameArray(k,:)), ' ', deblank(lastNameArray(k,:))])
end