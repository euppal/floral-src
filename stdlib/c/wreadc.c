#include "floral_cdef.h"

#include <wchar.h>

FloralVoid FloralID(wread, FloralTypeIDSuffixBuilder(FloralTypeIDInt, FloralTypeIDPointer))(FloralInt size, FloralWideChar* buffer) {
    fgetws(buffer, size, fdopen(0, "r"));
}
