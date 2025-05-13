#ifndef GAME_H
#define GAME_H

char* gameloop();
extern char * const Screen = (char *)0x0400;

#pragma compile("game.c")

#endif