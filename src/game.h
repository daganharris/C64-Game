#ifndef GAME_H
#define GAME_H

int gameloop_wrapper(byte bet);
extern char * const Screen = (char *)0x0400;

#pragma compile("game.c")

#endif