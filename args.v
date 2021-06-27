module main

import os
import os.cmdline

const all_options = [
	'-b',
	'-e',
	'-n',
	'-s',
	'-t',
	'-u',
	'-h',
	'-v',
]

struct Settings {
pub mut:
	number_non_blank_lines bool // -b Number the lines, but don't count blank lines
	print_dollar           bool //-e Print a dollar sign (‘$’) at the end of each line. Implies the -v option
	number_all             bool //-n Number the output lines, starting at 1.
	squeze_blank_lines     bool //-s Squeeze multiple adjacent empty lines, causing the output to be single spaced.
	print_tab              bool //-t Print tab characters as ‘^I’. Implies the -v option to display non-printing characters.
	unbuffered             bool //-u  The output is guaranteed to be unbuffered
	non_priting            bool //-v Displays non-printing characters so they are visible.
}

fn handle_args() ([]string, Settings) {
	// extract options and filenames
	args := os.args.clone()[1..] // raw args
	filenames := args.filter(!(it.starts_with('-') && it.bytes().len > 1)) // filenames, includes '-' (stdin)
	options := cmdline.only_options(args).filter(it != '-') // options, not including '-'

	println('options: $options\nfilename: $filenames')

	// check for correct options
	for option in options {
		if option in all_options {
			continue
		} else {
			panic('Unkown option $option')
		}
	}

	// help
	if '-h' in options {
		println('help message: TODO!')
		exit(0)
	}

	settings := Settings{
		number_non_blank_lines: '-b' in options
		print_dollar: '-e' in options
		number_all: '-n' in options
		squeze_blank_lines: '-s' in options
		print_tab: '-t' in options
		unbuffered: '-u' in options
		non_priting: '-v' in options
	}

	return filenames, settings
}
