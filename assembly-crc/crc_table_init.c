#include "crc.h"

void crc_table_init(uint8_t table[256]) {
    uint8_t remainder;
    for (uint8_t dividend = 0; ; ++dividend) {
        remainder = dividend;
        for (uint8_t bit = 0; bit < 8; ++bit) {
            if (remainder & 0x80) {
                remainder = (remainder << 1) ^ DIVISOR;
            } else {
                remainder = (remainder << 1);
            }
        }
        table[dividend] = remainder;
        if (dividend == 0xff) {
            break;
        }
    }
}

