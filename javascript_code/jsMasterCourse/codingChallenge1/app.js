/**
 * CODING CHALLENGE 1
 * 1. Store Mark and John's mass and height in variables
 * 2. Calculate both of their BMI's
 * 3. Create a boolean variable containing information about whether
 *    Mark has heigher BMI than John.
 * 4. Print a string to the console to tell if Mark's BMI is higher
 *    than John's.
 */

 /*
    Solution
    Author: Dillon Allen
    Date: 12/17/18
*/

var marksWeight = prompt("What is Mark's weight?");
var marksHeight = prompt("What is Mark's height?");

var johnsWeight = prompt("What is John's weight?");
var johnsHeight = prompt("What is John's height?");

var marksBMI = ( marksWeight / ( marksHeight * marksHeight ) );
var johnsBMI = ( johnsWeight / ( johnsHeight * johnsHeight ) );

var isMarkHigherThanJohn = marksBMI > johnsBMI;

console.log("Is Mark's BMI higher than John's? " + isMarkHigherThanJohn);