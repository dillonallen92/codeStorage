// score array


/**
 * TODO: 1. Get proper increments
 * 2. Proper mechanics of rolling 1
 * 3. Winner determined.
 * 4. Move dot for current player and background color transition
 */

// Create an Object for Player One
function player (activePlayer, score, onHold)
{
    this.activePlayer = activePlayer;
    this.score = score;
    this.onHold = onHold;
    this.rollDice = function () {
        dice = Math.floor(Math.random()*6) + 1;
        return dice;
    };
}


    var playerOne = new player(true, parseInt(0.0), false);
    var playerTwo = new player(false, parseInt(0.0), true);
    document.querySelector("#current-0").textContent = 0;
    document.querySelector("#current-1").textContent = 0;

    function gameRoll()
    {
        if ( playerOne.onHold === false)
        {
            dice = playerOne.rollDice();
            playerOne.score = playerOne.score + dice;
            console.log(dice);
            diceURL = "dice-" + dice + ".png";
            console.log(diceURL);
            document.getElementById("dice").src = diceURL;
            document.querySelector("#current-0").textContent = playerOne.score;
        }
        if (playerTwo.onHold === false)
        {
            playerTwo.score = playerTwo.score + playerTwo.rollDice();
            document.querySelector("#current-1").textContent = playerTwo.score;
        }
    }

    function holdDice()
    {
        if (playerOne.onHold === false)
        {
            playerOne.onHold = true;
            playerTwo.onHold = false;
            document.querySelector("#score-0").textContent = playerOne.score;
            document.querySelector("#current-0").textContent = 0;
        }
        else
        {
            playerTwo.onHold = true;
            playerOne.onHold = false;
            document.querySelector("#score-1").textContent = playerTwo.score;
            document.querySelector("#current-1").textContent = 0;
        }
    }


