#include "floral_cdef.h"
#include "itoa.h"
#include "wideio.h"
#include <stdio.h>
#include <string.h>
#include <stdarg.h>

#define strnequ(s1, s2, n) (strncmp((s1), (s2), (n)) == 0)
#define itoa FloralID(itoa, FloralTypeIDSuffixBuilder(FloralTypeIDInt, FloralTypeIDPointer))
#define wputchar FloralID(wputchar, FloralTypeIDWideChar)
#define wprint FloralID(wprint, FloralTypeIDPointer)

FloralVoid FloralID(
    print,
    FloralTypeIDSuffixBuilder(FloralTypeIDPointer, FloralTypeIDVariadic)
)(const FloralChar* fmt, ...) {
    FloralUInt i = 0;
    char current = fmt[i];

    va_list vl;
    va_start(vl, fmt);

    while (current) {
        if (current == '$' && fmt[i + 1] == '{') {
            fputc('{', stdout);
            i++;
            current = fmt[1 + i++];
            continue;
        } else if (current == '{') {
            i++;
            char typeID[17];
            FloralUInt ti = 0;
            while (fmt[i] != '}') {
                if (!fmt[i]) {
                    fputs("Invalid format string: missing trailing brace\n", stdout);
                    va_end(vl);
                    return;
                } else if (i > 16) {
                    fputs("Invalid format string: type id more than 16 chars\n", stdout);
                    va_end(vl);
                    return;
                }
                typeID[ti++] = fmt[i++];
            }
            typeID[ti] = 0;
            if strnequ(typeID, "i", 2) {
                char num_buf[21];
                FloralInt v = va_arg(vl, FloralInt);
                itoa(v, num_buf);
                fputs(num_buf, stdout);
            } else if strnequ(typeID, "c", 2) {
                const int ch = va_arg(vl, int);
                fputc(ch, stdout);
            } else if strnequ(typeID, "s", 2) {
                const FloralChar* str = va_arg(vl, FloralChar*);
                fputs(str, stdout);
            } else if strnequ(typeID, "wc", 2) {
                const FloralWideChar wch = va_arg(vl, FloralWideChar);
                wputchar(wch);
            } else if strnequ(typeID, "ws", 2) {
                const FloralWideChar* wstr = va_arg(vl, FloralWideChar*);
                wprint(wstr);
            }
        } else {
            fputc(current, stdout);
        }
        current = fmt[++i];
    }

    va_end(vl);
}

int main(int argc, char const *argv[]) {
    floralid_print_u_v("{i} {c} {ws} ${nope}\n", 1, 'a', L"Hey");
    return 0;
}
