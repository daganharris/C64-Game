#ifndef GAME_H
#define GAME_H

void gameloop();
extern char * const Screen = (char *)0x0400;

#pragma compile("game.c")

#endif