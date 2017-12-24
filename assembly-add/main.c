#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int add(int a, int b);

int main(int argc, char *argv[]) {
    printf("%s\n", "Adding with assembly!");
    if (argc < 3) {
        printf("Specify two arguments to add\n");
        return 0;
    }
    int a = atoi(argv[1]);
    int b = atoi(argv[2]);
    printf("%i + %i = %i\n", a, b, add(a, b));
}

