/***
 * Notes for Modern JS
 * ES5+
 */

 // Hoisting in practice
/*
 calculateAge(1965); // Called before the function was even declared 

 function calculateAge(year)
 {
     console.log(2018 - year);
 }

 calculateAge(1990);

retirement(1990); // This code wont work because a function expression
                 // doesnt work with hoisting and becomse undefined

 var retirement = function ( year ) {
     console.log(65 - (2018 - year));
 };
*/
 // This keyword

 var john = {
     name: 'John',
     yearOfBirth: 1990,
     calculateAge: function() {
         console.log(this);
         console.log(2018 - this.yearOfBirth);
     }
 };

 john.calculateAge();

 var mike = {
     name: "Mike",
     yearOfBirth: 1984,
 };

// function borrowing
 mike.calculateAge = john.calculateAge;

mike.calculateAge();