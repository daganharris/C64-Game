#include <stdio.h>
#include <include/c64/vic.h>
#include <include/c64/types.h>
#include "cursor.h"
#include "screens.h"



int main(void)
{
	__asm {
        jsr $E544 // clear the screen
    }

	draw_start1();
    vic_waitFrames(60);
    cursor_down();
    vic_waitFrames(60);
    cursor_right();
    vic_waitFrames(60);
    cursor_down();
    while (1);
}