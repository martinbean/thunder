#ifndef THUNDER_H
#define THUNDER_H

#define FILES_COUNT 851

typedef signed short int16_t;
typedef signed int int32_t;
typedef unsigned short uint16_t;
typedef unsigned char u_char;
typedef unsigned int uint32_t;
typedef unsigned short u_short;
typedef unsigned long u_long;
typedef unsigned long u_int;

typedef struct FileInfo {
    char padding[0x24];
} FileInfo;

#endif /* THUNDER_H */
