#include <stdio.h>
#include <include/c64/memmap.h>
#include <include/c64/vic.h>
#include "audio.h"

int main(void) {

	printf("PLAYBACK START");
    
	play_digi();

	printf("PLAYBACK STOP");

    return 0;
}