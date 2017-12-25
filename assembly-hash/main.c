#include <stdio.h>
#include <stdlib.h>
#include "hash.h"

int main(int argc, char *argv[]) {
    printf("Hash C String\n");
    if (argc < 2) {
        printf("Pass a string argument\n");
        return 1;
    }
    if (argc < 3) {
        printf("Pass a modulus argument\n");
        return 1;
    }
    char *str = argv[1];
    int mod = atoi(argv[2]);
    uint32_t hash = hash_string(str) % mod;
    printf("Result: %i\n", hash);
}

