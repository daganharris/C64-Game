#ifndef SCORING_H
#define SCORING_H

void add_score(const char *newInitials, int score);
void draw_scores();
char * enter_initials();
int race_score(byte bet, byte * order);

#pragma compile("scoring.c")

#endif