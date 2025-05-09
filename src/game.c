#include <stdio.h>
#include <conio.h>
#include <include/c64/vic.h>
#include <include/c64/sprites.h>
#include <include/c64/types.h>
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
	0b00000000, 0b11111000, 0b00000000,
	0b00000011, 0b11111110, 0b00000000,
	0b00001111, 0b11111111, 0b10000000,
	0b00011111, 0b11111111, 0b11000000,
	0b00111111, 0b11111111, 0b11100000,
	0b00111111, 0b11111111, 0b11100000,
	0b01111111, 0b11111111, 0b11110000,
	0b01111111, 0b11111111, 0b11110000,
	0b11111111, 0b11111111, 0b11111000,
	0b11111111, 0b11111111, 0b11111000,
	0b11111111, 0b11111111, 0b11111000,
	0b11111111, 0b11111111, 0b11111000,
	0b11111111, 0b11111111, 0b11111000,
	0b01111111, 0b11111111, 0b11110000,
	0b01111111, 0b11111111, 0b11110000,
	0b00111111, 0b11111111, 0b11100000,
	0b00111111, 0b11111111, 0b11100000,
	0b00011111, 0b11111111, 0b11000000,
	0b00001111, 0b11111111, 0b10000000,
	0b00000011, 0b11111110, 0b00000000,
	0b00000000, 0b11111000, 0b00000000
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
    p.color = 1;
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
        p.color++;
        if (p.color == 10) { p.color = 0; }
        if (p.color == 6) { p.color = 7; }
        spr_color(p.sp, p.color);
        if (p.xpos < LEFT_BORDER) p.xpos = LEFT_BORDER;
        if (p.xpos > RIGHT_BORDER) p.xpos = RIGHT_BORDER;
    }

    if (p.ypos <= TOP_BORDER || p.ypos >= BOTTOM_BORDER) {
        p.yVel = -p.yVel;
        p.color++;
        if (p.color == 10) { p.color = 0; }
        if (p.color == 6) { p.color = 7; }
        spr_color(p.sp, p.color);
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
