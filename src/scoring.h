#ifndef SCORING_H
#define SCORING_H

void add_score(const char *newInitials, int score);
void draw_scores();
char * enter_initials();

#pragma compile("scoring.c")

#endif