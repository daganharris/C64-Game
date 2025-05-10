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
}