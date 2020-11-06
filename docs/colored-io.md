# Floral Colored I/O

Floral not only provides basic I/O functionality, but primitive abstractions for printing colored output.

```swift
func coloredprint(& constChar, &const Char);
func colored256print(Int, &const Char);

func coloredwprint(&const Char, &const WideChar);
func colored256wprint(Int, &const WideChar);
```

The former variants (`colored[w]print`) take two arguments, both strings. Essentially all this does is print the first string and then the second. However, this is most interestingly utilized with the posix color code macros, e.g. `POSIX_RED`.

```swift
coloredwprint(POSIX_BLUE, W"𝔹𝕝𝕦𝕖 𝕗𝕒𝕟𝕔𝕪 𝕥𝕖𝕩𝕥\n");
print(POSIX_RESET);
```

This will output the provided utf-32 string in blue text. The second line is necessary or the entire terminal will remain blue from there on.
