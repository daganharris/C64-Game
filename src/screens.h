#ifndef SCREENS_H
#define SCREENS_H

void countdown_sequence();
void draw_map1();
void draw_start();
void draw_initials();
byte draw_play_again(int score);

#pragma compile("screens.c")

#endif