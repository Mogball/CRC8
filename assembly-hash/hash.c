#include "hash.h"

#define MUL_127(x) (((x) << 7) - (x))

uint32_t hash_string(const char *s) {
    uint32_t h = 0;
    for (; *s; ++s) {
        h = (MUL_127(h) + *s);
    }
    return h;
}

