#include <stdio.h>
#include <conio.h>
#include <include/c64/vic.h>
#include <include/c64/sprites.h>
#include <include/c64/types.h>
#include <stdbool.h>
#include <string.h>
#include "game.h"
#include "audio.h"


const char SpriteImage[64] = {
	0b00000000, 0b01111100, 0b00000000,
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

typedef struct 
{
    char sp;
    int xpos;
    int ypos;
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
    p.color = 1;
    p.show = true;
}

inline void makesprite() {
    memcpy(Sprite, SpriteImage, 64);
	spr_init(Screen);
    //poke(53280, 0);

    spr_set(p.sp, p.show, p.xpos, p.ypos, (unsigned)Sprite / 64, p.color, false, false, false); 
}

inline void updatesprite() {
    spr_set(p.sp, p.show, p.xpos, p.ypos, (unsigned)Sprite / 64, p.color, false, false, false);
}

inline void spritemovement() {
    char key = getch();

    switch (key)
    {
    case 'W':
    case 'w':
        p.ypos -= 10;
        break;
    case 'S':
    case 's':
        p.ypos += 10;
        break;
    case 'A':
    case 'a':
        p.xpos -= 10;
        break;
    case 'D':
    case 'd':
        p.xpos += 10;
        break;
    default:
        break;
    }
}

void gameloop() {
    count_down();
    initsprite();
    makesprite();

    while (true) {
        spritemovement();
        updatesprite();
        vic_waitFrames(1);
    }
}
