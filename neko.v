module main

import os

fn main() {
	// handle args might exit on errors(1) or help(0) exitcode=(n)
	// filenames: []string, settings Settings
	filenames, settings := handle_args()
	mut content := ''

	for filename in filenames {
		if filename == '-' {
			content = os.get_raw_lines_joined()
		} else {
			content = os.read_file(filename) or { panic('No Such File; $filename') }
		}
		uwued := uwu(content)
		formated := format(uwued, settings)

		println('$formated')
	}
}
