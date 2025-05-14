#include <stdio.h>
#include <conio.h>
#include <include/stdint.h>
#include <include/c64/types.h>
#include "game.h"
#include "screens.h"

typedef struct ScoreEntry{
    char initials[4];
    int score;
} ScoreEntry;

ScoreEntry entries[10];
int score_count = 0;

void write_char(int x, int y, char c) {
    Screen[40 * y + x] = c;
}

char read_char(int x, int y) {
    return Screen[40 * y + x];
}

void draw_scores() {
    for (int i = 0; i < 10; i++) {
        // Draw initials
        for (int j = 0; j < 3; j++) {
            if (entries[i].initials[j] != '\0') {
                write_char(j + 4, (i * 2) + 4, entries[i].initials[j]);
            }
        }

        // Draw score (only 3 digits max)
        int score = entries[i].score;
        int digits[3]; // Only 3 digits max
        int num_digits = 0;

        if (score == 0) {
            digits[num_digits++] = 0; // Handle score 0
        } else {
            while (score > 0 && num_digits < 3) {
                digits[num_digits++] = score % 10;
                score /= 10;
            }
        }

        // Write digits, starting at column 8
        for (int d = 0; d < num_digits; d++) {
            write_char(8 + (2 - d), (i * 2) + 4, digits[d] + 0x30);
        }
    }
}

void add_score(const char *newInitials, int score) {
    int pos = score_count;

    // Find insert position
    while (pos > 0 && score > entries[pos - 1].score) {
        if (pos < 10) entries[pos] = entries[pos - 1];
        pos--;
    }

    // Insert if not full yet
    if (score_count < 10) {
        score_count++;
    }
    // Otherwise, ignore if new score is worse than all
    else if (score <= entries[9].score) {
        return;
    }

    // Insert new score
    for (int i = 0; i < 3 && newInitials[i] != '\0'; ++i) {
        entries[pos].initials[i] = newInitials[i];
    }
    entries[pos].initials[3] = '\0';
    entries[pos].score = score;
}

char * enter_initials(){
    int x = 9;
    int y = 12;
    static char temp_initials[4];
    draw_initials();
    gotoxy(x, y);
    gets_s(temp_initials,4);
    return temp_initials;
}