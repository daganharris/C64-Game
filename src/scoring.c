#include <stdio.h>
#include <include/c64/types.h>

// Ararys are synced
int scores[10];
char initials[10][4];

void copy_str(char *dest, char *src, int max_len) {
    int j = 0;
    while (j < max_len - 1 && src[j] != '\0') {
        dest[j] = src[j];
        j++;
    }
    dest[j] = '\0';
}

void add_score(const char *newInitials, int score) {
    byte min_score_pos = get_min_score_pos();
    if (min_score_pos < 9) {
        min_score_pos++;
        copy_str(initials[min_score_pos], newInitials, 4);
        scores[min_score_pos] = score;
        sort_scores();
    }
    
    if (scores[min_score_pos] < scores) {
        copy_str(initials[min_score_pos], newInitials, 4);
        scores[min_score_pos] = score;
        sort_scores();
    }
}

void draw_scores(){
    
}

int get_min_score_pos(){
    byte pos = 9;
    while (scores[pos] == 0 || pos != 0){
        pos--;
    }
    return pos;
}

void sort_scores() {
    for (int i = 0; i < 9; ++i) {
        for (int j = i + 1; j < 9; ++j) {
            if (scores[i] < scores[j]) {
                int temp_score = scores[i];
                scores[i] = scores[j];
                scores[j] = temp_score;
                char temp_initials[4];
                copy_str(temp_initials, initials[i], 4);
                copy_str(initials[i], initials[j], 4);
                copy_str(initials[j], temp_initials, 4);
            }
        }
    }
}
