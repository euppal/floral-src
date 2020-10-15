#include <stdio.h>
#include <wchar.h>
#include "floral_cdef.h"

void floralid_wputchar_wch(FloralWideChar widechar) {
    wprintf(L"%lc", widechar);
}

void floralid_wprint_u(FloralWideChar* widestr) {
    wprintf(L"%ls", widestr);
}
