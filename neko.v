module main

import os

fn main() {
	filenames := handle_args()

	filename := filenames[1]
	content := os.read_file(filename) or { panic('bruh no such file!') }

	uwu_content := uwu(content)

	println('$filename:\n $uwu_content')
}

// uwufy text
