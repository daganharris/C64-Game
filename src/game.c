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
#include "screens.h"

#define SPRITE_BASE_ADDR 0x2000

#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 200

#define SPRITE_WIDTH 24
#define SPRITE_HEIGHT 21

#define LEFT_BORDER 24
#define RIGHT_BORDER 320
#define TOP_BORDER 50
#define BOTTOM_BORDER (250 - SPRITE_HEIGHT)  // = 228

#define SCREEN_RAM ((byte*)0x0400)
#define CHARSET_RAM ((byte*)0x1000)  // default charset memory location
#define SCREEN_COLS 40
#define CHAR_WIDTH 8
#define CHAR_HEIGHT 8

#define MIN(a,b) (((a)<(b))?(a):(b))
#define MAX(a,b) (((a)>(b))?(a):(b))

char spriteOrder[3] = {255,255,255};

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

const char *spriteImages[] = {
    spr1Img,
    spr2Img,
    spr3Img,
    spr4Img 
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

typedef struct {
    short int x;
    short int y;
} Position;

Position startPositions[3] = {
    {10 + LEFT_BORDER, 10 + TOP_BORDER},
    {10 + LEFT_BORDER, 50 + TOP_BORDER},
    {55 + LEFT_BORDER, 38 + TOP_BORDER}
};

int positionIndex = 0;

Player Blueberry;
Player Banana;
Player Apple;
Player Basket = {
    .sp = 3,
    .xpos = 125,
    .ypos = 155,
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

typedef struct {
    bool xCollision;
    bool yCollision;
} CollisionResult;

CollisionResult checkForegroundCollision(Player *sprite) {
    CollisionResult result = { false, false };

    int left = sprite->xpos / 8;
    int right = (sprite->xpos + SPRITE_WIDTH - 1) / 8;
    int top = sprite->ypos / 8;
    int bottom = (sprite->ypos + SPRITE_HEIGHT - 1) / 8;

    for (int row = top; row <= bottom; row++) {
        for (int col = left; col <= right; col++) {
            if (col >= 40 || row >= 25) continue;

            byte ch = SCREEN_RAM[row * 40 + col];
            if (ch != 32) {
                // Basic assumption: horizontal collision if moving horizontally, same for vertical
                if (sprite->xVel != 0) result.xCollision = true;
                if (sprite->yVel != 0) result.yCollision = true;
                return result;  // Exit early for speed
            }
        }
    }
    return result;
}

void shuffleStartPositions() {
    for (int i = 2; i > 0; i--) {
        int j = rand() % (i + 1);
        Position temp = startPositions[i];
        startPositions[i] = startPositions[j];
        startPositions[j] = temp;
    }
}

inline void initsprite(Player *p, int no, char color) {
    if (positionIndex >= 3) return;  // safety check

    p->sp    = no;
    p->xpos  = startPositions[positionIndex].x;
    p->ypos  = startPositions[positionIndex].y;
    positionIndex++;

    p->xVel  = 2;
    p->yVel  = ((short int)rand() % 2 == 0) ? 2 : -2;
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
        p->xpos = MAX(LEFT_BORDER, MIN(p->xpos, RIGHT_BORDER));
    }

    if (p->ypos <= TOP_BORDER || p->ypos >= BOTTOM_BORDER) {
        p->yVel = -p->yVel;
        p->ypos = MAX(TOP_BORDER, MIN(p->ypos, BOTTOM_BORDER));
    }

CollisionResult collision = checkForegroundCollision(p);
if (collision.xCollision) p->xVel = -p->xVel;
if (collision.yCollision) p->yVel = -p->yVel;

    spr_move(p->sp, p->xpos, p->ypos);
}

bool isSpritePixelSet(const char *sprite, int x, int y) {
    if (x < 0 || x >= 24 || y < 0 || y >= 21) return false;

    int byteIndex = y * 3 + x / 8;
    int bit = 7 - (x % 8);
    return (sprite[byteIndex] >> bit) & 1;
}

bool pixelPerfectCollision(Player *a, Player *b) {

    const char *aSpriteData = spriteImages[a->sp];
    const char *bSpriteData = spriteImages[b->sp];

    int x_overlap_start = MAX(a->xpos, b->xpos);
    int x_overlap_end   = MIN(a->xpos + SPRITE_WIDTH, b->xpos + SPRITE_WIDTH);
    int y_overlap_start = MAX(a->ypos, b->ypos);
    int y_overlap_end   = MIN(a->ypos + SPRITE_HEIGHT, b->ypos + SPRITE_HEIGHT);

    if (x_overlap_start >= x_overlap_end || y_overlap_start >= y_overlap_end)
        return false;

    // Loop over overlapping pixels
    for (int y = y_overlap_start; y < y_overlap_end; y++) {
        for (int x = x_overlap_start; x < x_overlap_end; x++) {
            int a_x = x - a->xpos;
            int a_y = y - a->ypos;
            int b_x = x - b->xpos;
            int b_y = y - b->ypos;

            if (isSpritePixelSet(aSpriteData, a_x, a_y) &&
                isSpritePixelSet(bSpriteData, b_x, b_y)) {
                return true; // Collision!
            }
        }
    }

    return false;
}

inline bool isColliding(Player *a, Player *b) {
    return !(a->xpos + SPRITE_WIDTH  < b->xpos ||
             a->xpos > b->xpos + SPRITE_WIDTH  ||
             a->ypos + SPRITE_HEIGHT < b->ypos ||
             a->ypos > b->ypos + SPRITE_HEIGHT);
}


void handleCollision(Player *p1, Player *p2) {
    if (pixelPerfectCollision(p1, p2)) {
        p1->xVel = -p1->xVel;
        p1->yVel = -p1->yVel;
        p2->xVel = -p2->xVel;
        p2->yVel = -p2->yVel;
    }
}

bool handleBasketCollision(Player *p1, Player *basket) {
    if (isColliding(p1, basket)) {
        spr_show(p1->sp, false);
        p1->xVel = 0;
        p1->yVel = 0;
        p1->xpos = basket->xpos;
        p1->ypos = basket->ypos;
        spr_move(p1->sp, p1->xpos, p1->ypos);
        for (int i = 0; i < 3; i++) {
            if (spriteOrder[i] == 255) {
                spriteOrder[i] = p1->sp;
                if (i == 2) {
                    return true;
                }
                break;
            }
        }
    }
    return false;
}

inline void gameloop() {
    poke(53281, 0);
    poke(53280, 12);
    poke(646,1);
    draw_map1();
    initsprite(&Blueberry, 0, 4);
    makesprite(&Blueberry, spr1Img, SpriteMem1);
    initsprite(&Banana, 1, 7);
    makesprite(&Banana, spr2Img, SpriteMem2);
    initsprite(&Apple, 2, 5);
    makesprite(&Apple, spr3Img, SpriteMem3);
    makesprite(&Basket, spr4Img, SpriteMem4);

    bool gameOver = false;
    while (!gameOver) {        
        updatesprite(&Blueberry);
        updatesprite(&Banana);
        updatesprite(&Apple);

        handleCollision(&Blueberry, &Banana);
        handleCollision(&Blueberry, &Apple);
        handleCollision(&Banana, &Apple);

        if (handleBasketCollision(&Blueberry, &Basket)) gameOver = true;
        if (handleBasketCollision(&Banana, &Basket)) gameOver = true;
        if (handleBasketCollision(&Apple, &Basket)) gameOver = true;

        vic_waitFrame();
    }
}
