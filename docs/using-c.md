# Using Bridged C Functions

Floral has interpolability with C. In fact, the header `floral_cdef.h` contains many macros and type definitions which allow you to define and run Floral functions from C. To use bridged C functions you include the header `cbridge.fh`, which contains various string, memory and i/o C functions such as `malloc`, `strncat` and `getchar`.
