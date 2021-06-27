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

fn handle_args() ([]string, Settings) {
	// extract options and filenames
	args := os.args.clone()[1..] // raw args

	// filenames, includes '-' (stdin)
	filenames := args.filter(!(it.starts_with('-') && it.bytes().len > 1))
	// options, not including '-'
	options_tmp := cmdline.only_options(args).filter(it != '-')

	mut options := []string{}

	// split '-eab' into '-e' '-'a', '-b'..
	for option in options_tmp {
		if option.len > 1 {
			for o in option.split('')[1..] {
				options.prepend('-$o')
			}
		}
	}

	// check for correct options
	for option in options {
		if option in all_options {
			continue
		} else {
			panic('Unkown option $option')
		}
	}

	// help, exit
	if '-h' in options {
		println('$help_text')
		exit(0)
	}

	settings := Settings{
		number_non_blank_lines: '-b' in options
		print_dollar: '-e' in options
		number_all: '-n' in options
		squeze_blank_lines: '-s' in options
		print_tab: '-t' in options
		unbuffered: '-u' in options
		non_printing: '-v' in options
	}

	return filenames, settings
}
