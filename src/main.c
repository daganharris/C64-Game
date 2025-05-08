#include <stdio.h>
#include <include/c64/vic.h>
#include <include/c64/types.h>
#include "game.h"



int main(void)
{
	    __asm {
        jsr $E544 // clear the screen
    }
    
	gameloop();
	// // Fill screen memory with all 256 characters
	// byte *ptr = Screen;
	// for(int i = 0; i < 256; i++)
	// 	*ptr++ = i;
	// return 0;

	// poke(646,2); // change text color to red
}



