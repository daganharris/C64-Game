#include <stdio.h>
#include <include/c64/vic.h>
#include <include/c64/types.h>
#include "game.h"
#include "screens.h"
#include "scoring.h"




int main()
{
	__asm {
        jsr $E544 // clear the screen
    }

    while (1) {
        byte flag = 1;
        int session_score = 0;
        // Blueberry = 0, Apple = 1, Banana = 2
        byte session_bet = 255;

        draw_start();
        char * session_initials = enter_initials();
        countdown_sequence();
        while (flag){
            int s_session_score = gameloop_wrapper(session_bet);
            session_score += s_session_score;
            flag = draw_play_again(session_score);
        }
        add_score(session_initials, session_score);
    }
}