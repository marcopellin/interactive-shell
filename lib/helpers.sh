
# print success helpers
success_echo() {
	local text=$1
	echo -e "$GREEN$text$RESET"
}

# print error message helper
error_echo() {
	local text=$1
	echo -e "$ALERT$text$RESET"
}

# print term message helper
term_echo() {
	local text=$1
	echo -e "$YELLOW$text$RESET"
}

type_echo() {
	local text=$1
	echo -e "$DARKBLUE$text$RESET"
}

link_echo() {
	local text=$1
	echo -e "$LINK$text$RESET"
}

# end
