module main

struct Settings {
pub mut:
	number_non_blank_lines bool // -b Number the lines, but don't count blank lines
	print_dollar           bool //-e Print a dollar sign (‘$’) at the end of each line. Implies the -v option
	number_all             bool //-n Number the output lines, starting at 1.
	squeze_blank_lines     bool //-s Squeeze multiple adjacent empty lines, causing the output to be single spaced.
	print_tab              bool //-t Print tab characters as ‘^I’. Implies the -v option to display non-printing characters.
	unbuffered             bool //-u  The output is guaranteed to be unbuffered
	non_printing           bool //-v Displays non-printing characters so they are visible.
}

fn format(text string, raw_settings Settings) string {
	mut settings := raw_settings
	mut output := text

	if settings.squeze_blank_lines {
		output = squeze_blank_lines(output)
		settings.non_printing = true
	}

	if settings.print_tab {
		output = print_tab(output)
		settings.non_printing = true
	}

	if settings.print_dollar {
		output = print_dollar(output)
	}

	if settings.non_printing {
		output = non_printing(output)
	}

	if settings.number_all {
		output = number_all(output)
	} else if settings.number_non_blank_lines {
		output = number_non_blank_lines(output)
	}

	if settings.unbuffered {
		output = unbuffered(output)
	}

	return output
}

// ===================== HELPER FUNCTIONS ==========================

//-s Squeeze multiple adjacent empty lines, causing the output to be single spaced.
fn squeze_blank_lines(text string) string {
	mut prev := ' '
	output := text.split('\n').filter(if it == '' && prev == '' {
		false
	} else {
		prev = it
		true
	})

	return output.join('\n')
}

//-e Print a dollar sign (‘$’) at the end of each line. Implies the -v option
fn print_dollar(text string) string {
	return text.split('\n').map('$it $').join('\n')
}

//-n Number the output lines, starting at 1.
fn number_all(text string) string {
	mut i := 1
	return text.split('\n').map('${i++} $it').join('\n')
}

// -b Number the lines, but don't count blank lines
fn number_non_blank_lines(text string) string {
	// TODO: align lines!
	mut i := 0
	return text.split('\n').map(if it == '' { it } else { '${i++} $it' }).join('\n')
}

// -t Print tab characters as ‘^I’. Implies the -v option to display non-printing characters.
fn print_tab(text string) string {
	return text.replace('\t', '^I')
}

// TODO: -v Displays non-printing characters so they are visible.
fn non_printing(text string) string {
	return text
}

// TODO: -u  The output is guaranteed to be unbuffered
fn unbuffered(text string) string {
	return text
}
