module main

import os

fn handle_args() []string {
	args := os.args.clone()
	return args
}
