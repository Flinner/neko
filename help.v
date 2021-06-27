module main

const help_text = "NAME cat — concatenate and print files

    SYNOPSIS cat [-benstuv] [file ...]

    DESCRIPTION

        The cat utility reads files sequentially, writing them to the
        standard output. The file operands are processed in command-line
        order. If file is a single dash (‘-’) or absent, cat reads from
        the standard input.

    The options are as follows:

        -b
        Number the lines, but don't count blank lines.

        -e
        Print a dollar sign (‘$’) at the end of each line. Implies the -v
        option to display non-printing characters.

        -n
        Number the output lines, starting at 1.

        -s
        Squeeze multiple adjacent empty lines, causing the output to be
        single spaced.

        -t
        Print tab characters as ‘^I’. Implies the -v option to display
        non-printing characters.

        -u UNIMPLEMENTED
        The output is guaranteed to be unbuffered (see setvbuf(3)).

        -v UNIMPLEMENTED
        Displays non-printing characters so they are visible. Control
        characters print as ‘^X’ for control-X, with the exception of the
        tab and EOL characters, which are displayed normally. The DEL
        character (octal 0177) prints as ‘^?’. Non-ASCII characters (with
        the high bit set) are printed as ‘M-’ (for meta) followed by the
        character for the low 7 bits.
    See Also: https://github.com/flinner/neko
"
