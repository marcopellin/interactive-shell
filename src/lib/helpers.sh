#!/bin/bash

GREEN="\033[0;32m"
RESET="\033[0m"
ALERT="\033[0;31m"
YELLOW="\033[1;33m"
DARKBLUE="\033[0;36m"
LINK="\033[0;34m"
PURPURE="\033[1;35m"

# print success helper
success_echo() {
	local text=$1
	echo -e "\n$GREEN$text$RESET"
}

# print error message helper
error_echo() {
	local text=$1
	echo -e "\n$ALERT$text$RESET"
}

# print term message helper
term_echo() {
	local text=$1
	echo -e "$YELLOW$text$GREEN"
}

type_echo() {
	local text=$1
	echo -e "\n$DARKBLUE$text$RESET"
}

# end
