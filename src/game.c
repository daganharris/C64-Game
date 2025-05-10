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

#define SPRITE_BASE_ADDR 0x2000

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
const char spr3Img[64] = {
    15,153,240,29,219,248,51,255,252,103,255,254,79,255,254,223,255,255,176,254,31,230,124,207,230,124,207,240,254,31,255,255,255,255,255,255,255,255,253,255,255,249,255,255,243,127,255,246,63,255,228,63,255,140,31,191,56,15,99,240,3,193,224
};
const char spr4Img[64] = {
    0,12,0,0,30,0,0,51,0,0,97,128,0,192,192,1,128,96,127,255,254,162,42,35,197,68,85,168,138,137,145,81,21,170,34,163,196,84,69,138,136,169,145,21,17,98,162,42,68,69,70,40,168,140,17,17,88,14,42,48,3,255,192
};
char * const Screen = (char *)0x0400;
char * const SpriteMem1 = (char *)(SPRITE_BASE_ADDR + 0);
char * const SpriteMem2 = (char *)(SPRITE_BASE_ADDR + 64);
char * const SpriteMem3 = (char *)(SPRITE_BASE_ADDR + 128);
char * const SpriteMem4 = (char *)(SPRITE_BASE_ADDR + 192);
// char * const SpriteMem5 = (char *)(SPRITE_BASE_ADDR + 256);
// char * const SpriteMem6 = (char *)(SPRITE_BASE_ADDR + 320);
// char * const SpriteMem7 = (char *)(SPRITE_BASE_ADDR + 384);
// char * const SpriteMem8 = (char *)(SPRITE_BASE_ADDR + 448);

typedef struct 
{
    char sp;
    unsigned short int xpos;
    unsigned short int ypos;
    short int xVel; // Horizontal velocity
    short int yVel; // Vertical velocity
    char color;
    bool show;
} Player;

Player Blueberry;
Player Banana;
Player Apple;
Player Basket = {
    .sp = 3,
    .xpos = 50,
    .ypos = 100,
    .xVel = 0,
    .yVel = 0,
    .color = 12,
    .show = true
};

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
    p->xpos  = 50 + ((short int)rand() % (300 - 50 + 1));    // 50 to 300
    p->ypos  = 75 + ((short int)rand() % (200 - 75 + 1));    // 75 to 200
    p->xVel  = ((short int)rand() % 2 == 0) ? 2 : -2;        // +2 or -2
    p->yVel  = ((short int)rand() % 2 == 0) ? 2 : -2;        // +2 or -2
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

inline bool isColliding(Player *a, Player *b) {
    return !(a->xpos + SPRITE_WIDTH  < b->xpos ||
             a->xpos > b->xpos + SPRITE_WIDTH  ||
             a->ypos + SPRITE_HEIGHT < b->ypos ||
             a->ypos > b->ypos + SPRITE_HEIGHT);
}

void handleCollision(Player *p1, Player *p2) {
    if (isColliding(p1, p2)) {
        p1->xVel = -p1->xVel;
        p1->yVel = -p1->yVel;
        p2->xVel = -p2->xVel;
        p2->yVel = -p2->yVel;
    }
}

void handleBasketCollision(Player *p1, Player *basket) {
    if (isColliding(p1, basket)) {
        spr_show(p1->sp, false);
        p1->xVel = 0;
        p1->yVel = 0;
        p1->xpos = basket->xpos;
        p1->ypos = basket->ypos;
        spr_move(p1->sp, p1->xpos, p1->ypos);
    }
}

inline void gameloop() {
    initsprite(&Blueberry, 0, 4);
    makesprite(&Blueberry, spr1Img, SpriteMem1);
    initsprite(&Banana, 1, 7);
    makesprite(&Banana, spr2Img, SpriteMem2);
    initsprite(&Apple, 2, 5);
    makesprite(&Apple, spr3Img, SpriteMem3);
    makesprite(&Basket, spr4Img, SpriteMem4);


    while (true) {        
        updatesprite(&Blueberry);
        updatesprite(&Banana);
        updatesprite(&Apple);

        handleCollision(&Blueberry, &Banana);
        handleCollision(&Blueberry, &Apple);
        handleCollision(&Banana, &Apple);

        handleBasketCollision(&Blueberry, &Basket);
        handleBasketCollision(&Banana, &Basket);
        handleBasketCollision(&Apple, &Basket);

        vic_waitFrame();
    }
}
