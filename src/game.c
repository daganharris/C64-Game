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

#define MAP_COLS 40
#define MAP_ROWS 25

#define MIN(a,b) (((a)<(b))?(a):(b))
#define MAX(a,b) (((a)>(b))?(a):(b))

char spriteOrder[3] = {255,255,255};

const char map_screen[] = {  79,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,116, 32, 32, 32, 32, 79,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119, 80,
116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 76,111, 32, 32, 32,116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103,
116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103,111,111,111,116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103,
116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103,
116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 79,
116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,111,101,
116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,101, 32,
116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,101, 32,
116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,101, 32,
 76,111,111, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 63, 63, 63, 63, 63, 63, 32, 32, 32, 32, 32, 32, 76,111,
 23,  9,116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 63, 23,  8, 15, 32, 63, 32, 32, 32, 32, 32, 32, 32,103,
  9, 23,116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 63, 23,  9, 12, 12, 63, 32, 32, 32, 32, 32, 32, 32,103,
 14,  9, 79,119,119,119,119,119,119,119,119,119,119, 80, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 63, 23,  9, 14, 32, 63, 32, 32, 32, 32, 32, 32, 32,103,
 23, 14,116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 63, 63, 63, 63, 63, 63, 32, 32, 32, 32, 32, 32, 32,103,
  9, 23,116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103,
 14,  9,116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103,
 23, 14,116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103,
  9, 23,116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103,
 14,  9,116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103,
 23, 14,116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103,
  9, 23,116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103,
 14,  9,116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,103,
 23, 14,116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 85, 73, 32, 32, 85, 73, 32, 32,111,111,122,
  9, 23,116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,109,125,127,255,109,125, 32, 32,116, 32, 32,
 14,  9, 76,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,116, 32, 32

};

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
    {25 + LEFT_BORDER, 40 + TOP_BORDER},
    {75 + LEFT_BORDER, 50 + TOP_BORDER}
};

int positionIndex = 0;

Player Blueberry;
Player Banana;
Player Apple;
Player Basket = {
    .sp = 3,
    .xpos = 100,
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

    p->sp = no;
    p->xpos = startPositions[positionIndex].x;
    p->ypos = startPositions[positionIndex].y;
    positionIndex++;

    p->xVel = 2;
    p->yVel = ((short int)rand() % 2 == 0) ? 2 : -2;
    p->color= color;
    p->show = true;
}

inline void makesprite(Player *p, const char *sprImg, const char *SpriteMem) {
    memcpy(SpriteMem, sprImg, 64);
    spr_init(Screen);

    spr_set(p->sp, p->show, p->xpos, p->ypos, (unsigned)SpriteMem / 64, p->color, false, false, false);
}

// Add checkCollision function before updatesprite
bool checkCollision(Player *p) {
    int left = p->xpos - LEFT_BORDER;
    int top = p->ypos - TOP_BORDER;
    int right = left + SPRITE_WIDTH;
    int bottom = top + SPRITE_HEIGHT;

    // Convert to map columns and rows
    int left_col = left / CHAR_WIDTH;
    int right_col = (right - 1) / CHAR_WIDTH; // Adjust to avoid overflow
    int top_row = top / CHAR_HEIGHT;
    int bottom_row = (bottom - 1) / CHAR_HEIGHT;

    // Clamp values to map boundaries
    if (left_col < 0) left_col = 0;
    if (right_col >= MAP_COLS) right_col = MAP_COLS - 1;
    if (top_row < 0) top_row = 0;
    if (bottom_row >= MAP_ROWS) bottom_row = MAP_ROWS - 1;

    // Check each tile in the sprite's area
    for (int row = top_row; row <= bottom_row; row++) {
        for (int col = left_col; col <= right_col; col++) {
            char tile = map_screen[row * MAP_COLS + col];
            if (tile != 32) { // 32 is empty space
                return true; // Collision detected
            }
        }
    }
    return false; // No collision
}

// Modify updatesprite to handle collisions
inline void updatesprite(Player *p) {
    int oldX = p->xpos;
    int oldY = p->ypos;

    // Move in X direction and check collision
    p->xpos += p->xVel;
    if (checkCollision(p)) {
        p->xpos = oldX;
        p->xVel = -p->xVel;
    }

    // Move in Y direction and check collision
    p->ypos += p->yVel;
    if (checkCollision(p)) {
        p->ypos = oldY;
        p->yVel = -p->yVel;
    }

    spr_move(p->sp, p->xpos, p->ypos);
}

inline bool isColliding(Player *a, Player *b) {
    return !(a->xpos + SPRITE_WIDTH  < b->xpos ||
             a->xpos > b->xpos + SPRITE_WIDTH  ||
             a->ypos + SPRITE_HEIGHT < b->ypos ||
             a->ypos > b->ypos + SPRITE_HEIGHT);
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
        
        // Find the first empty slot in the spriteOrder array
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

inline char* gameloop() {
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
    return spriteOrder;
}
