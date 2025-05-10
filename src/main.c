#include <stdio.h>
#include <include/c64/memmap.h>
#include "screens.h"

int main(void)
{
	__asm {
        jsr $E544 // clear the screen
	}

	countdown_sequence();

	while (1);

	return 0;
}