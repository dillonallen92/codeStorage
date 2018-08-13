#include <iostream>
//#include "stdafx.h"
#include <vector>
#include <array>
#include <cstdlib>
#include <ctime>

enum CardSuit
{
    SUIT_CLUB,
    SUIT_SPADES,
    SUIT_DIAMOND,
    SUIT_HEART,
    MAX_SUITS
};

enum CardRank
{
    RANK_2,
    RANK_3,
    RANK_4,
    RANK_5,
    RANK_6,
    RANK_7,
    RANK_8,
    RANK_9,
    RANK_10,
    RANK_JACK,
    RANK_KING,
    RANK_QUEEN,
    RANK_ACE,
    MAX_RANKS
};

struct CARD 
{
    CardSuit suit;
    CardRank rank; 
    
};

void printCard(const CARD &card){ // passed in a reference using &
    switch (card.rank){
        case RANK_2:
            std::cout << "2";
            break;
        case RANK_3:
            std::cout << "3";
            break;
        case RANK_4:
            std::cout << "4";
            break;
        case RANK_5:
            std::cout << "5";
            break;
        case RANK_6:
            std::cout << "6";
            break;
        case RANK_7:
            std::cout << "7";
            break;
        case RANK_8:
            std::cout << "8";
            break;
        case RANK_9:
            std::cout << "9";
            break;
        case RANK_10:
            std::cout << "10";
            break;
        case RANK_ACE:
            std::cout << "A";
            break;
        case RANK_JACK:
            std::cout << "J";
            break;
        case RANK_KING:
            std::cout << "K";
            break;
        case RANK_QUEEN:
            std::cout << "Q";
            break;
    }

    switch (card.suit){
        case SUIT_CLUB:
            std::cout << "C";
            break;
        case SUIT_DIAMOND:
            std::cout << "D";
            break;
        case SUIT_HEART:
            std::cout << "H";
            break;
        case SUIT_SPADES:
            std::cout << "S";
            break;
    }
}

void printDeck(std::array<CARD, 52> &deck){
    int cardNumber = 0; 
    for (int i = 0; i < MAX_SUITS; i++){
        for (int j = 0; j < MAX_RANKS; j++){
            printCard(deck[cardNumber]);
            std::cout << " "; 
            cardNumber++;
        }
        std::cout << "\n"; 
    }

}

void swapCards(CARD &card1, CARD  &card2){
    CARD temp = card1; 
    card1 = card2; 
    card2 = temp; 
}

void shuffle(std::array<CARD, 52> &deck)
{
    for (int i = 0; i < 5; i++)
    {
        for (auto &card : deck)
        {
            static double const fraction = 1.0 / (1.0 + RAND_MAX);
            int card1 = static_cast<int>(52 * (std::rand() * fraction));
            int card2 = static_cast<int>(52 * (std::rand() * fraction));
            swapCards(deck[card1], deck[card2]);
        }
    }
}
int getRandomNumber(int min, int max){
    static const double fraction = 1.0/(1.0 + RAND_MAX);

    return (min + (max-min +1)*(std::rand()*fraction)); 
}

int getCardValue(CARD &card, bool ACE1){
    switch(card.rank){
        case RANK_2:
            return 2; 
            break;
        case RANK_3:
            return 3;  
            break;
        case RANK_4:
            return 4;  
            break;
        case RANK_5:
            return 5; 
            break;
        case RANK_6:
            return 6; 
            break;
        case RANK_7:
            return 7; 
            break;
        case RANK_8:
            return 8;  
            break;
        case RANK_9:
            return 9;  
            break;
        case RANK_10:
            return 10; 
            break;
        case RANK_ACE: 
            //(ACE1)? (return 1):(return 11); 
            if (ACE1){
                return 1; 
            }else{
                return 11; 
            }
            break;
        case RANK_KING:
            return 10;  
            break;
        case RANK_QUEEN:
            return 10; 
            break;
        case RANK_JACK:
            return 10; 
            break; 
    }
}

bool HouseHitOrStay(int x){
    int prob = getRandomNumber(0,99);
    switch (21-x){
        case 6:
            if (prob > 10){
                return true; 
            }else{
                return false; 
            }
            break;
        case 5:
            if (prob > 30){
                return true; 
            }else{
                return false; 
            }
            break;
        case 4:
            if (prob > 65){
                return true; 
            }
            break;
        case 3:
            if (prob > 85){
                return true; 
            }else {
                return false; 
            }
            break;
        case 2:
            if (prob > 95){
                return true; 
            }else{
                return false; 
            }
            break;
        case 1:
            if (prob > 98){
                return true; 
            }else{
                return false; 
            }
            break; 
        
    }
}

int main(){

    //CARD c1; 
    //c1.rank = RANK_ACE;
    //c1.suit = SUIT_SPADES;
    //printCard(c1); 
    //std::vector<CARD> deck;
    std::array<CARD, 52> deck;
    //actually create the deck 

    int currentCard = 0; 
    for (int i = 0; i < static_cast<int>(MAX_SUITS); i++){
        
        for (int j = 0; j < static_cast<int>(MAX_RANKS); j++){
            deck[currentCard].suit = static_cast<CardSuit>(i);
            deck[currentCard].rank = static_cast<CardRank>(j); 
            currentCard++;
        }

    }
    
    //printDeck(deck); 
    //swapCards(deck[3], deck[16]);
     
    std::srand(static_cast<unsigned int>(std::time(0)));
    std::rand();
    std::srand(rand()); 
    std::rand();

    int random1 = getRandomNumber(0, 51); 


    /*
    List of Functions available 
    printCard();        (CARD)
    printDeck();        (std::array<CARD, int> arrayName)
    getCardValue();     (CARD)
    shuffle();          (std::array<CARD, int> arrayName) 
    swapCards();        (CARD, CARD)
    getRandomNumber();  (int min, int max)
    */ 
    bool playingBlackJack = true; 
    while (playingBlackJack){
        //printDeck(deck);  
        std::array<int, 10> playerCardIndex {0,0,0,0,0,0,0,0,0,0}; 
        std::array<int, 10> houseCardIndex {0,0,0,0,0,0,0,0,0,0};
        bool gameOver = false; 
        bool addCardPlayer = true; 
        bool addCardHouse = true; 
        bool ACE1_P = false; 
        bool ACE1_H = false; 
        int temp1 = 0;
        int temp2 = 0; 
        int playerCardNum = 0; 
        int houseCardNum = 0; 
        int roundCount = 0; 
        //shuffle(deck);
        shuffle(deck);
        std::cout << "\n"; 
        //printDeck(deck); 
        char playBJ; 
        std::cout << "Play Blackjack? (y/n) \n";
        std::cin >> playBJ; 
        switch (playBJ){
            case 'y':
                gameOver = false; 
                break; 
            case 'n':
                gameOver  = true; 
                playingBlackJack = false; 
                temp1 = 0; 
                temp2 = 0; 
                break; 
            case 'Y':
                gameOver = false;
                break;
            case 'N':
                gameOver = true;
                playingBlackJack = false; 
                temp1 = 0; 
                temp2 = 0; 
                break;
        }
        while (!gameOver){
            std::cout << "You are now playing Black Jack\n";
        nextRound:
            roundCount++;
            int playerCard = 0; 
            if (addCardPlayer){
                playerCard = getRandomNumber(0, 51);
                playerCardNum++; 
                playerCardIndex[playerCardNum] = playerCard;
                
                if (21 - temp1 < 11){
                    ACE1_P = true; 
                }
                temp1 += getCardValue(deck[playerCard], ACE1_P); 
                
            }
            std::cout << "Round " << roundCount << "\n"; 
            std::cout << "\nUser : " ; 
            for (int i = 1; i < playerCardNum+1; i++){
                printCard(deck[playerCardIndex[i]]); 
                std::cout << " "; 
            }
            
            std::cout << "  Total Player value :\t" << temp1 << "\n"; 

            // check player 
            if (temp1 > 21){
                gameOver = true; 
                std::cout << "You busted, the House wins.\n"; 
                temp1 = 0; 
                temp2 = 0; 
                break; 
            }
            if (temp1 == 21){
                gameOver = true; 
                std::cout << "You got 21!\n"; 
                temp1 = 0; 
                temp2 = 0; 
                break;
            }


            //get house card
            int houseCard = 0; 
            if (addCardHouse){
                houseCard = getRandomNumber(0, 51);
                houseCardNum++; 
                houseCardIndex[houseCardNum] = houseCard;
                if (21 - temp2 < 11){
                    ACE1_H = true;
                }
                temp2 += getCardValue(deck[houseCard], ACE1_H);
            }
             
            std::cout << "House : ";  
            for (int i = 1; i < houseCardNum+1; i++){
                printCard(deck[houseCardIndex[i]]);
                std::cout << " "; 
            }
            
            std::cout << "  Total House value :\t" << temp2 << " \n";  
            
            //check AI
            if (temp2 > 21){
                gameOver = true; 
                std::cout << "The House busted, you win!\n"; 
                temp1 = 0; 
                temp2 = 0; 
                break;
            }
            if (temp2 == 21){
                gameOver = true; 
                std::cout << "The House got 21, you lose.\n"; 
                temp1 = 0; 
                temp2 = 0; 
                break; 
            }
            //decide if AI should hit or stay
            if (21 - temp2 < 7){
                addCardHouse = HouseHitOrStay(temp2); 
            }

            //Ask player hit or stay 
            std::cout << "Hit ('h'), Stay ('s'), Quit ('q') : "; 
            char input; 
            std::cin >> input; 
            std::cin.ignore(3000, '\n'); 
            switch (input){
                case 'h':
                    addCardPlayer = true; 
                    goto nextRound;
                    break;
                case 's':
                    addCardPlayer = false;
                    goto nextRound; 
                    break;
                case 'q': 
                    gameOver = true;
                    playingBlackJack = false; 
                    temp1 = 0; 
                    temp2 = 0; 
                    break; 
            }
            //decide it AI should hit or stay
            
            
            
        }
    }

    return 0; 
}