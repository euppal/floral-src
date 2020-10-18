# The Floral Standard Library

The Floral STL (standard library) contains core functions and utilities common to the majority of programs (I/O, memory allocation, etc). It also contains bridged C functions.

The standard library is automatically linked by default with `floralc`, but to use the functions, you must include the proper header. Including STL headers has a different syntax: you surround the header file with angle brackets rather than quotation marks.

```c
#include "local_header.fh"
#include <stl_header.fh>
```
