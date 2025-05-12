#include <stdio.h>
#include <include/c64/vic.h>
#include <include/c64/types.h>
#include "game.h"
#include "screens.h"
#include "scoring.h"




int main(void)
{
	__asm {
        jsr $E544 // clear the screen
    }

    while (1) {
        byte flag = 1;
        int temp_score = 0;
        byte temp_order[3] = {0, 1, 2};
        // Blueberry = 0, Apple = 1, Banana = 2
        byte temp_bet = 0;

        draw_start();
        char * temp_initials = enter_initials();
        countdown_sequence();

        while (flag){
	        gameloop();
            temp_score += race_score(temp_bet, temp_order);
            flag = draw_play_again(temp_score);
        }
        add_score(temp_initials, temp_score);
    }
}