# Floral I/O

There are various ways to do input and output operations in Floral. The most obvious is to use the Floral STL functions. These can be found in the io header.

Functions for null-terminated ascii strings include:
```swift
func print(const &Char);
func print_buffered(const &Char);
func read(Int, &Char);
func coloredprint(const &Char, const &Char);
func colored256print(Int, const &Char);
```

Functions for null-terminated utf32 strings include:
```swift
func wread(Int, &WideChar);
func wputchar(WideChar);
func wprint(const &WideChar);
func coloredwprint(const &Char, const &WideChar);
func colored256wprint(Int, const &WideChar);
```

One alternative to the Floral STL I/O is to use bridged C functions such as `getchar` and `puts`. This can be done by including the proper header or manually by placing the `using C` directive and forward-declaring the necessary functions.

```swift
#include <cbridge.fh>

func main(): Int {
    while (getchar() != 'q') {
        puts("Not Q");
    }
    return 0;
}
```
