# Neko
Wnix kawaii /bin/cat wike (≡^-ω-^≡) - concatenate fi-fiwes awnd pwint
own the standawd output!

![neko](https://user-images.githubusercontent.com/85732279/123555535-08a10e80-d78f-11eb-96db-b78949d87065.png)


**Neko** is a very fast and lightweight implementaion of the `cat`
utility, written in [V](https://github.com/vlang/v) it is
*almost* compliant with the [IEEE Std 1003.1-2008 (“POSIX.1”)](https://standards.ieee.org/standard/1003_1-2008.html)
specification.

# Features

## UwU
**Neko** converts input to UwU-ify'ed text!

```sh
❯ neko interjection.txt

	I'd just wike to intewject fow a moment.  What you'we wefewwing to as Linyux,
	is in fact, GNU/Linyux, ow as I'ffe wecentwy taken to cawwing it, GNU pwus Linyux.

```

## Performance
Even though **neko** does a lot of checks and replacements, it still performs toe-to-toe with `GNU cat`

```sh
❯ time (for i in {1..10}; do neko LICENSE > /dev/null; done)
0.02s user 0.00s system 101% cpu 0.026 total

❯ time (for i in {1..10}; do cat LICENSE > /dev/null; done)
0.01s user 0.00s system 106% cpu 0.006 total

```

## Kawamoji
some characters are replaced with kawamojies :3
```txt
U_U, >w<, O_O,...
```

## Stutring (unimplemented)

Random stutr is added for a cuter effect
```sh
I'd ju-just like to i-in-interject for a moment...

```


# Installation

```sh
# Clone the repo
git clone https://github.com/flinner/neko.git
# build
cd neko && v -prod .

```
# Specification
## NAME
**neko** (≡^-ω-^≡) -- concatenate fi-fiwes awnd pwint own the standawd output

## SYNOPSIS
`cat [-benst] [file..] [-(stdin)]`

## DESCRIPTION

The **neko** utility reads files sequentially, writing them to the standard
output. The file operands are processed in command-line order. If file
is a single dash (‘-’) or absent, neko reads from the standard input.

The Options are as follows

| Option | Description                                                                                                  |
|--------|--------------------------------------------------------------------------------------------------------------|
| `-b`   | Number the lines, but don't count blank lines.                                                               |
| `-e`   | Print a dollar sign (‘$’) at the end of each line. Implies the -v option to display non-printing characters. |
| `-n`   | Number the output lines, starting at 1.                                                                      |
| `-s`   | Squeeze multiple adjacent empty lines, causing the output to be single spaced.                               |
| `-t`   | Print tab characters as `^I`. Implies the `-v` option to display non-printing characters.                    |
| `-u`   | The output is guaranteed to be unbuffered (*unimplemented*)                                                  |
| `-v`   | Displays non-printing characters so they are visible  (*unimplemented*)                                      |

## EXIT STATUS
The **neko** utility exits 0 on success, and >0 if an error occurs.

# EXAMPLES

1. UwU-ify the contents of `file1` to the standard output:

```sh 
❯ neko file1

```

2. Sequentially print the contents of `file1` and `file2` to the file
   `file3`, truncating `file3` if it already exists. See the manual page
   for your shell (e.g., sh(1)) for more information on redirection.


```sh
❯ neko file1 file2 > file3
```
   
3. Print the contents of `file1`, print data it receives from the
   standard input until it receives an `EOF` (‘^D’) character, print the
   contents of `file2`, read and output contents of the standard input
   again, then finally output the contents of `file3`. 
   
```sh
❯ neko file1 - file2 - file3
```

## STANDARDS
The **neko** utility is almost compliant with the IEEE Std 1003.1-2008
(“POSIX.1”) specification. see [CAVEATS](##CAVEATS)

The flags [-benstv] are extensions to that specification.

## CAVEATS
1. Because **neko** *UwU-ify*s text, it doesn't comply with
[IEEE Std 1003.1-2008 (“POSIX.1”)](https://standards.ieee.org/standard/1003_1-2008.html)
2. Because some checks require multiple characters, ex `Na`->`Nya`,
   **neko** can not be truly unbuffered, when `-u` is implemented,
   buffer will be of one line sized.

3. `-v` flag is *not* POSIX standard. As such, there are no plans to implement it

# CREDITS
A Lot of the `README.md` was taken from Openbsd's [cat(1) man page](https://man.openbsd.org/cat.1)
