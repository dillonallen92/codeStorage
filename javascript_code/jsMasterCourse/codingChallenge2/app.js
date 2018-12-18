/***
 * Coding Challenge 2
 * 
 * Playing basketball games, johns team scored 89, 129, and 103 points.
 * Mikes scored 116, 94, 123 points.
 * 
 * 1. Calculate the average of the scores for each team.
 * 2. Determine who wins in average and print the winning team to 
 *    the console.
 * 3. Change the scores to show different winners.
 * 
 * EXTRA: Mary also plays and her team scored 97, 134, 105.
 */

 /*
    Coding Challenge 2 Solution
    Author: Dillon Allen
    Date: 12/17/18
*/

var johnsTeamAverage = ( ( 89 + 129 + 103 ) / 3 );
var mikesTeamAverage = ( ( 116 + 94 + 123 ) / 3 );
var marysTeamAverage = ( ( 97 + 134 + 105 ) / 3 );

console.log(" John's Team Average = " + johnsTeamAverage);
console.log(" Mike's Team Average = " + mikesTeamAverage);
console.log(" Mary's Team Average = " + marysTeamAverage);

if ( (johnsTeamAverage > mikesTeamAverage) && (johnsTeamAverage > marysTeamAverage) )
{
    console.log("Johns Team Average is the highest");
}
else if ((mikesTeamAverage > johnsTeamAverage) && (mikesTeamAverage > marysTeamAverage))
{
    console.log("Mikes team average is the highest");
}
else{
    console.log("Marys is the highest");
}