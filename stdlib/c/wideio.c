#include <stdio.h>
#include <wchar.h>
#include "wideio.h"

FloralVoid FloralID(wputchar, FloralTypeIDWideChar)(const FloralWideChar widechar) {
    wprintf(L"%lc", widechar);
}

FloralVoid FloralID(wprint, FloralTypeIDPointer)(const FloralWideChar* widestr) {
    wprintf(L"%ls", widestr);
}
