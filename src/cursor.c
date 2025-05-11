#include <conio.h>
#include <stdio.h>
#include <c64/vic.h>

byte * const Screen = (byte*)0x0400;
byte * const Color = (byte*)0xd800;

char y = 0;
char x = 0;

void current_char(){
    printf(Screen[40 * y + x]);
}

void cursor_up() {
    byte const Prev = Screen[40 * y + x];
    Screen[40 * y + x] = 0x20;
    if (y > 0) y--;
    Screen[40 * y + x] = Prev;
}

void cursor_down() {
    byte const Prev = Screen[40 * y + x];
    Screen[40 * y + x] = 0x20;
    if (y < 24) y++;
    Screen[40 * y + x] = Prev;
}

void cursor_left() {
    byte const Prev = Screen[40 * y + x];
    Screen[40 * y + x] = 0x20;
    if (x > 0) x--;
    Screen[40 * y + x] = Prev;
}

void cursor_right() {
    byte const Prev = Screen[40 * y + x];
    Screen[40 * y + x] = 0x20;
    if (x < 39) x++;
    Screen[40 * y + x] = Prev;
}