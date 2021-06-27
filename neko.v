module main

import os

fn main() {
	// handle args might exit on errors(1) or help(0) exitcode=(n)
	// filenames: []string, settings Settings
	filenames, settings := handle_args()

	for filename in filenames {
		if filename == '-' {
			println('TODO: stdin')
		} else {
			content := os.read_file(filename) or { panic('TODO: msg:  no such file!') }

			uwued := uwu(content)
			formated := format(uwued, settings)

			println('$formated')
		}
	}
	println('$settings')
}
