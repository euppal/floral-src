#include "coloredio.h"

FloralVoid FloralID(coloredprint, FloralTypeIDSuffixBuilder(FloralTypeIDPointer, FloralTypeIDPointer))(const FloralChar* color, const FloralChar* string) {
    fputs(color, stdout);
    fputs(string, stdout);
    fputs(POSIX_RESET, stdout);
}

FloralVoid FloralID(coloredwprint, FloralTypeIDSuffixBuilder(FloralTypeIDPointer, FloralTypeIDPointer))(const FloralChar* color, const FloralWideChar* string) {
    fputs(color, stdout);
    floralid_wprint_u(string);
    fputs(POSIX_RESET, stdout);
}
