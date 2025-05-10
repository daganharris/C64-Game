#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <include/c64/vic.h>
#include <include/c64/sprites.h>
#include <include/c64/types.h>
#include <include/c64/memmap.h>
#include <stdbool.h>
#include <string.h>
#include "game.h"

#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 200

#define SPRITE_WIDTH 24
#define SPRITE_HEIGHT 21

#define LEFT_BORDER 24
#define RIGHT_BORDER 320
#define TOP_BORDER 50
#define BOTTOM_BORDER (250 - SPRITE_HEIGHT)  // = 228

const char spr1Img[64] = {
    0,24,0,3,59,128,7,101,224,15,125,224,31,131,248,31,255,252,63,255,254,63,255,254,120,126,30,123,126,222,251,126,223,251,126,223,248,126,26,255,255,242,127,255,228,63,255,204,63,255,216,31,255,144,15,255,48,3,255,192,0,126,0
};
const char spr2Img[64] = {
    24,0,0,24,0,0,60,0,0,60,0,0,124,0,0,126,0,0,126,0,0,127,0,0,127,0,0,127,128,0,127,192,0,63,224,0,63,240,0,63,248,0,31,254,0,31,255,128,15,255,128,7,255,240,1,255,248,0,255,252,0,63,255
};
char * const Screen = (char *)0x0400;
char * const SpriteMem1 = (char *)0x0380;
char * const SpriteMem2 = (char *)0x03C0;


typedef struct 
{
    char sp;
    int xpos;
    int ypos;
    int xVel; // Horizontal velocity
    int yVel; // Vertical velocity
    char color;
    bool show;
} Player;

Player Blueberry;
Player Banana;

inline void poke(unsigned addr, byte value)
{
	*(volatile char *)addr = value;
}

inline byte peek(unsigned addr)
{
	return *(volatile char *)addr;
}

inline void initsprite(Player *p, int no, char color) {
    p->sp    = no;
    p->xpos  = 50 + (rand() % (300 - 50 + 1));    // 50 to 300
    p->ypos  = 75 + (rand() % (200 - 75 + 1));    // 75 to 200
    p->xVel  = (rand() % 2 == 0) ? 2 : -2;        // +2 or -2
    p->yVel  = (rand() % 2 == 0) ? 2 : -2;        // +2 or -2
    p->color = color;
    p->show  = true;
}

inline void makesprite(Player *p, const char *sprImg, const char *SpriteMem) {
    memcpy(SpriteMem, sprImg, 64);
    spr_init(Screen);

    spr_set(p->sp, p->show, p->xpos, p->ypos, (unsigned)SpriteMem / 64, p->color, false, false, false);
}

inline void updatesprite(Player *p) {
    p->xpos += p->xVel;
    p->ypos += p->yVel;

    if (p->xpos <= LEFT_BORDER || p->xpos >= RIGHT_BORDER) {
        p->xVel = -p->xVel;
        if (p->xpos < LEFT_BORDER) p->xpos = LEFT_BORDER;
        if (p->xpos > RIGHT_BORDER) p->xpos = RIGHT_BORDER;
    }

    if (p->ypos <= TOP_BORDER || p->ypos >= BOTTOM_BORDER) {
        p->yVel = -p->yVel;
        if (p->ypos < TOP_BORDER) p->ypos = TOP_BORDER;
        if (p->ypos > BOTTOM_BORDER) p->ypos = BOTTOM_BORDER;
    }

    spr_move(p->sp, p->xpos, p->ypos);
}

inline void gameloop() {
    initsprite(&Blueberry, 0, 4);
    makesprite(&Blueberry, spr1Img, SpriteMem1);
    initsprite(&Banana, 1, 7);
    makesprite(&Banana, spr2Img, SpriteMem2);

    while (true) {        
        updatesprite(&Blueberry);
        updatesprite(&Banana);
        vic_waitFrame();
    }
}
