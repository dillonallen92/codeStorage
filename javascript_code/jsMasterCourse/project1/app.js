// score array

var scores, roundScores, activePlayer, dice;

scores = [0,0];
roundScores = 0;
activePlayer = 0;


document.querySelector("#current-0").textContent = dice;

/*
function rollDice()
{
    dice = Math.floor(Math.random() *6) + 1;
    diceURL = "dice-" + dice + ".png";
    document.getElementById("dice").src = diceURL;
    console.log("rolldice clicked, rolled a " + dice + " with diceURL of: " + diceURL);
    if (activePlayer === 0)
    { 
        document.querySelector("#current-0").textContent = dice;
    }
}
*/

// Create an Object for Player One
function player (activePlayer, score, onHold)
{
    this.activePlayer = activePlayer;
    this.score = score;
    this.onHold = onHold;
    this.rollDice = function (){
        dice = Math.floor(Math.random()*6) + 1;
    };
}


    var playerOne = new player(true, 0, false);
    var playerTwo = new player(false, 0, true);

    function gameRoll()
    {
        while( playerOne.onHold === false)
        {
            playerOne.score = playerOne.score + playerOne.rollDice();
        }
        while ( playerTwo.onHold === false)
        {
            playerTwo.score = playerTwo.score + playerTwo.rollDice();
        }
    }

    function holdDice()
    {
        if (playerOne.onHold === false)
        {
            playerOne.onHold = true;
            document.querySelector("#score-0").textContent = playerOne.score;
        }
        else
        {
            playerTwo.onHold = true;
            document.querySelector("#score-1").textContent = playerTwo.score;
        }
    }


