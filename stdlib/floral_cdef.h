#include <inttypes.h>
#include <stddef.h>

#define FloralTypeIDChar ch
#define FloralTypeIDUChar uch
#define FloralTypeIDShort i16
#define FloralTypeIDUShort u16
#define FloralTypeIDInt32 i32
#define FloralTypeIDUInt32 u32
#define FloralTypeIDInt i
#define FloralTypeIDUInt u
#define FloralTypeIDPointer u
#define FloralTypeIDInt i
#define _floralmacro__cat(a, b) a ## b
#define _floralmacro_cat(a, b) _floralmacro__cat(a, b)
#define FloralTypeIDSuffixBuilder(a, b) _floralmacro_cat(_floralmacro_cat(a, _), b)
#define FloralID(foo, types) floralid_foo_ ## types

typedef void FloralVoid;

typedef int8_t FloralInt8;
typedef uint8_t FloralUInt8;
typedef int16_t FloralInt16;
typedef uint16_t FloralUInt16;
typedef int32_t FloralInt32;
typedef uint32_t FloralUInt32;
typedef int64_t FloralInt64;
typedef uint64_t FloralUInt64;

typedef FloralInt8 FloralChar;
typedef FloralUInt8 FloralUChar;
typedef FloralInt16 FloralShort;
typedef FloralUInt16 FloralUShort;
typedef FloralInt32 FloralWideChar;
typedef FloralUInt32 FloralWideUChar;
typedef FloralInt64 FloralInt;
typedef FloralUInt64 FloralUInt;

typedef int64_t FloralBool;
#define FloralTrue 1
#define FloralFalse 0

#define FloralNull NULL
