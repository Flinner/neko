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
	filenames := args.filter(!(it.starts_with('-') && it.bytes().len > 1)) // filenames, includes '-' (stdin)
	mut options := cmdline.only_options(args)

	// options, not including '-'
	options = options.filter(it != '-')
	// TODO: split '-eab' into '-e' '-'a', 'b'..
	options = options.map(if it.bytes().len > 2 { it } else { it })

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
