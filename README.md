# commr

Rust version of `comm`

## Synopsis

`commr` reads two files and reports the lines of text that are common to both and the lines that are unique to each.
These are set operations where the common lines are the _intersection_ of the two files and the unique lines are the _difference_.
If you are familiar with databases, you might also consider these as types of _join_ operations.

```
$ commr --help
Rust version of comm

Usage: commr [OPTIONS] <FILE1> <FILE2>

Arguments:
  <FILE1>  Input file 1
  <FILE2>  Input file 2

Options:
  -1                                  Show column 1
  -2                                  Show column 2
  -3                                  Show column 3
  -i, --insensitive                   Case-insensitive comparison of lines
  -d, --output-delimiter <DELIMITER>  Output delimiter [default: "\t"]
  -h, --help                          Print help
  -V, --version                       Print version
```

The output is three columns of text separated by the `--output-delimiter`:

1. The lines unique to file1
2. The lines unique to file2
3. The lines common to both files

For instance, given these files:

```
$ cat tests/inputs/file1.txt
a
b
c
d
$ cat tests/inputs/file2.txt
B
c
```

The default output will be:

```
$ commr tests/inputs/file1.txt tests/inputs/file2.txt
	B
a
b
		c
d
```

The output again with a delimiter to make it easier to see the columns:

```
$ commr tests/inputs/file1.txt tests/inputs/file2.txt -d='--->'
--->B
a
b
--->--->c
d
```

One of the input files may be `STDIN` (standard in) as indicated by a dash (`-`):

```
$ commr tests/inputs/file1.txt - -d='--->' <tests/inputs/file2.txt
--->B
a
b
--->--->c
d
```

Both inputs may not be `STDIN`:

```
$ commr - -
Both input files cannot be STDIN ("-")
```

Use the `-i|--insensitive` flag for case-insensitive comparisons:

```
$ commr tests/inputs/file1.txt tests/inputs/file2.txt -i
a
		b
		c
d
```

## Rationale

The BSD/GNU versions of `comm` use the `-1`, `-2`, and `-3` flags to _suppress_ the printing of the columns.
This Rust version inverts the meanings to mean these columns should be _shown_.
Like the `wc` program, the default will be to show _all_ the columns unless the user indicates which columns they wish to see.

## Author

Ken Youens-Clark <kyclark@gmail.com>
