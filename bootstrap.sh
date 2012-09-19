#!/bin/bash
cd "$(dirname "$0")"

# The basic rsync copy helper function by Mathias
function do_rsync() {
	rsync\
		--backup --backup-dir ".dotfiles-bak"\
		--exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh"\
		--exclude "README.md" --exclude "init/" \
		-av . ~
}

# Initialize: source files in init/
function do_init() {
	local files=(./init/*)
	for file in "${files[@]}"; do
		source "$file"
	done
}

function do_all() {
	do_rsync
	do_init
}


# Enough with functions, now do stuff

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	do_all
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		do_all
	fi
fi

unset do_all
unset do_rsync
unset do_init

source ~/.bash_profile
