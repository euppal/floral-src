#include <stdlib.h>
#include <stdio.h>
#include "itoa.h"

void reverse(FloralChar* buffer, FloralInt length) {
    if (!length) return;
    FloralInt i = 0;
    FloralInt j = length - 1;
    while (i < j) {
        const FloralChar temp = buffer[i];
        buffer[i] = buffer[j];
        buffer[j] = temp;
        i++;
        j--;
    }
}

FloralVoid FloralID(itoa, FloralTypeIDSuffixBuilder(FloralTypeIDInt, FloralTypeIDPointer))(const FloralInt value, FloralChar* buffer) {
    // Variable/constant setup
    FloralInt idx = 0;
    FloralUInt abs;

    abs = value < 0 ? -value : value;

    while (abs) {
        buffer[idx++] = ('0' + (abs % 10));
        abs /= 10;
    }

    // Add negative sign if less than zero
    if (value < 0) {
        buffer[idx++] = '-';
    }

    // Buffer will be backwards
    reverse(buffer, idx);

    // Append null terminator
    buffer[idx] = 0;
}
