#ifndef GAME_H
#define GAME_H

void gameloop();
int gameloop_fix_i_pray(int bet);
extern char * const Screen = (char *)0x0400;

#pragma compile("game.c")

#endif