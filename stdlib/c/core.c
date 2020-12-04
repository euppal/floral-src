#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include "floral_cdef.h"

void init_floral() {
    setlocale(LC_ALL, "");
}

void FloralID(stkgrd_fail, FloralTypeIDSuffixBuilder(FloralTypeIDPointer, FloralTypeIDPointer))(char* ret, char* rbp) {
    fputs("\e[33mSECURITY\e[0;0m: return address overwritten. May be evidence of buffer overflow attack.\n", stderr);
    fprintf(stderr, "    Current return address: %p\n    Current base pointer: %p\n", ret , rbp);
    exit(1);
}
