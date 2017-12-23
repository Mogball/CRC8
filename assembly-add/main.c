#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

extern int32_t add(int32_t a, int32_t b);

int main(int argc, char *argv[]) {
    printf("%s\n", "Adding with assembly!");
    if (argc < 3) {
        printf("Specify two arguments to add\n");
        return 0;
    }
    int32_t a = (int32_t) atoi(argv[1]);
    int32_t b = (int32_t) atoi(argv[2]);
    printf("%i + %i = %i\n", a, b, add(a, b));
}

