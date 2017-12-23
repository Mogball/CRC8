#include <stdio.h>
#include <stdint.h>

#include "crc.h"

/*
 * CRC-8
 * 0x97 = x^8 + x^5 + x^3 + x^2 + x + 1
 * Divisor: 100101111
 */
int main() {
    uint8_t crc_table[256];
    printf("CRC-8 0x97\n");
    uint8_t test[] = {231, 212, 62, 117, 120, 195, 98, 23};
    crc_table_init(crc_table);
    uint8_t result = crc_calc(test, crc_table);
    printf("Test result: %i\n", result);
    uint8_t err[] = {231, 212, 62, 117, 120, 195, 98, 21};
    result = crc_calc(err, crc_table);
    printf("Err result: %i\n", result);
}

