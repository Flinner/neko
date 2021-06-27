module main

import os

fn main() {
	// handle args might exit on errors(1) or help(0) exitcode=(n)
	filenames, settings := handle_args()

	for filename in filenames {
		content := os.read_file(filename) or { panic('bruh no such file!') }
		println('${uwu(content)}')
	}
	println('$settings')
}
