#ifndef CRC_H
#define CRC_H

#include <stdint.h>

#define DIVISOR 0x97

void crc_table_init(uint8_t table[256]);
uint8_t crc_calc(uint8_t message[8], uint8_t table[256]);

#endif

