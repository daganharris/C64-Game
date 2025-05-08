#include <stdio.h>

int main()
{
    __asm {
        jsr $E544 // clear the screen
    }
    

    return 0;
}
