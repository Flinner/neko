module main

import os

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

fn main() {
	// handle args might exit on errors(1) or help(0) exitcode=(n)
	filenames, settings := handle_args()

	for filename in filenames {
		content := os.read_file(filename) or { panic('bruh no such file!') }
		println('${uwu(content)}')
	}
	println('$settings')
}
