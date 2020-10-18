#include "colored256io.h"
#include <string.h>
#include "wideio.h"
#include <stdio.h>
#include "itoa.h"

// '\e[38;5;CODEm'

FloralVoid FloralID(colored256print, FloralTypeIDSuffixBuilder(FloralTypeIDInt, FloralTypeIDPointer))(FloralInt color, FloralChar* string) {
    if (color >= 0 && color < 256) {
        char escape_seq[12];
        strncpy(escape_seq, "\e[38;5;", 8);
        floralid_itoa_i_u(color, escape_seq + 7);
        strncat(escape_seq, "m", 2);
        fputs(escape_seq, stdout);
        fputs(string, stdout);
        fputs(POSIX_RESET, stdout);
    } else {
        fputs(string, stdout);
    }
}

FloralVoid FloralID(colored256wprint, FloralTypeIDSuffixBuilder(FloralTypeIDInt, FloralTypeIDPointer))(FloralInt color, FloralWideChar* wstring) {
    if (color >= 0 && color < 256) {
        char escape_seq[12];
        strncpy(escape_seq, "\e[38;5;", 8);
        floralid_itoa_i_u(color, escape_seq + 7);
        strncat(escape_seq, "m", 2);
        fputs(escape_seq, stdout);
        floralid_wprint_u(wstring);
        fputs(POSIX_RESET, stdout);
    } else {
        floralid_wprint_u(wstring);
    }
}
