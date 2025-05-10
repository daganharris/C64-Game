#include <stdio.h>
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

const char SpriteImage[64] = {
    0,24,0,3,59,128,7,101,224,15,125,224,31,131,248,31,255,252,63,255,254,63,255,254,120,126,30,123,126,222,251,126,223,251,126,223,248,126,26,255,255,242,127,255,228,63,255,204,63,255,216,31,255,144,15,255,48,3,255,192,0,126,0
};
char * const Screen = (char *)0x0400;
char * const Sprite = (char *)0x0380;


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

Player p;

inline void poke(unsigned addr, byte value)
{
	*(volatile char *)addr = value;
}

inline byte peek(unsigned addr)
{
	return *(volatile char *)addr;
}

inline void initsprite() {
    p.sp = 0;
    p.xpos = 100;
    p.ypos = 100;
    p.xVel = 2; // Constant horizontal velocity
    p.yVel = 2; // Constant vertical velocity
    p.color = 4; // Color of the sprite
    p.show = true;
}

inline void makesprite() {
    memcpy(Sprite, SpriteImage, 64);
    spr_init(Screen);

    spr_set(p.sp, p.show, p.xpos, p.ypos, (unsigned)Sprite / 64, p.color, false, false, false);
}

inline void updatesprite() {
    p.xpos += p.xVel;
    p.ypos += p.yVel;

    if (p.xpos <= LEFT_BORDER || p.xpos >= RIGHT_BORDER) {
        p.xVel = -p.xVel;
        if (p.xpos < LEFT_BORDER) p.xpos = LEFT_BORDER;
        if (p.xpos > RIGHT_BORDER) p.xpos = RIGHT_BORDER;
    }

    if (p.ypos <= TOP_BORDER || p.ypos >= BOTTOM_BORDER) {
        p.yVel = -p.yVel;
        if (p.ypos < TOP_BORDER) p.ypos = TOP_BORDER;
        if (p.ypos > BOTTOM_BORDER) p.ypos = BOTTOM_BORDER;
    }

    spr_move(p.sp, p.xpos, p.ypos);
}

inline void gameloop() {
    initsprite();
    makesprite();

    while (true) {        
        updatesprite();
        vic_waitFrame();
    }
}
