#include "floral_cdef.h"
#include <unistd.h>

char _printbuffer[512];
int _length = 0;

FloralVoid FloralIDn(flush)() {
    write(1, _printbuffer, _length);
    _length = 0;
}

FloralVoid FloralID(print_buffered, FloralTypeIDPointer)(const FloralChar* str) {
    while (*str) {
        _printbuffer[_length++] = *str++;
        if (_length >= 512) {
            FloralIDn(flush)();
        }
    }
}
