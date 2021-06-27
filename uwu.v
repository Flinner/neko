module main

import rand

const eyes = [['>', '<'], ['Q', 'Q'], ['U', 'U'], ['O', 'O'],
	['^', '^'],
]

const mouths = ['w', 'W', '_', '.']

const vowels = ['a', 'e', 'i', 'o', 'u']

fn uwu(raw_content string) string {
	// v fmt!!!
	mut uwu := raw_content.replace_each([
		'r',
		'w', //
		'l',
		'w', //
		'R',
		'W', //
		'Th',
		'D', //
		'th',
		'd', //
		'v',
		'ff', //
		'V',
		'Ff', //
		'Ove',
		'uv', //
		'ove',
		'Uv', //
	])

	// replace '!' with a random face
	for uwu.contains('!') {
		uwu = uwu.replace_once('!', face())
	}
	// Na -> Nya (all vowels)
	for vowel in vowels {
		uwu = uwu.replace('N' + vowel, 'Ny' + vowel)
		uwu = uwu.replace('n' + vowel, 'ny' + vowel)
	}
	return uwu
}

fn face() string {
	eye := eyes[rand.int31() % eyes.len]
	mouth := mouths[rand.int31() % mouths.len]
	return ' ' + eye[0] + mouth + eye[1]
}
