VERSION="2.0.0"
# exrcise for learning mkdir command
mkdirExercise() {

	local input
	local correct="mkdir firstFolder"

	echo " "
	type_echo "Type 'mkdir firstFolder'"

	read -p "  ❯  " input

	success() {

		if [ -e "./firstFolder" ]; then
			error_echo " Seems like you already have folder with such name. "
			echo " Would you like to delete existing $(type_echo 'firstFolder') or skip to next challenge? [y/N] "
			read -p " ❯ " choice

			case $choice in
				y|Y|yes|Yes )
						rm -r ./firstFolder
						mkdirExercise
					;;
				* )
					UPDATE "cdExercise"
					SAVE_STAT
					next "cdExercise"
				;;
			esac

		else
			mkdir ./firstFolder
		fi

		success_echo "Congratulations! Now you create your first folder!"
		echo "$(term_echo 'mkdir') command is used for creating folders"
		echo "So in our case we created folder with name 'firstFolder'"
		echo "You can learn more about it here: $(link_echo 'http://document.link')"
		UPDATE "cdExercise"
		SAVE_STAT
		next "cdExercise"
	}
	error() {
		restarting "mkdirExercise"
	}

	checkInput "$input" "$correct" success error

}

# exercise for learning cd
cdExercise() {

	# CHECK if foder exist
	local input
	local correct="cd firstFolder"

	echo " "
	success_echo "Cool! We have folder lets move into in"
	type_echo "Type 'cd firstFolder'"
	read -p "  ❯  " input;

	success() {

		if [ -e "./firstFolder" ]; then
			cd ./firstFolder
			success_echo "Cool. Now you in firstFolder, that you created before"
			echo "$(term_echo 'cd') command used for navigation from folder to folder"
			echo "Learn more about it here: $(link_echo 'http://document.link')"
			UPDATE "touchExercise"
			SAVE_STAT
			next "touchExercise"
		else
			error_echo "not found folder"
			echo "Would you like to crete 'firstFolder'"
			read -p "  ❯  " input;
		fi
	}
	error() {
		restarting "cdExercise"
	}

	checkInput "$input" "$correct" success error
}

# exercise for learning touch command
touchExercise() {

	local input
	local correct="touch sample.txt"

	if [ ! -e "./firstFolder" ]; then
		error_echo "Seems like you don't have folder 'firstFolder'"
		echo "Would you like to create it? [Y|n]"
		read -p "  ❯ " val

		case $val in
			n|N )
					touchExercise
				;;
			*)
					mkdir ./firstFolder;
					touchExercise
				;;
		esac
	fi

	if [[ $(pwd | grep 'firstFolder') == "" ]]; then
		cd ./firstFolder
	fi


	local path

	path=$(pwd)

	echo " "
	echo "Lets create one file in this folder"
	type_echo "Type 'touch sample.txt'"
	term_echo "You in: ${path##*/}"
	read -p "  ❯ " input

	success() {
		success_echo "Cool"
		echo "$(term_echo 'touch') command is used for creating new files"
		echo "Learn more here: $(link_echo 'http://document.link')"
		touch ./sample.txt
		UPDATE "cpExercise"
		SAVE_STAT
		next "cpExercise"
	}
	error() {
		restarting "touchExercise"
	}

	checkInput "$input" "$correct" success error
}

# pwd exercise
rmExercise() {

	local input
	local correct="rm sample-copy.txt"

	echo " "
	echo "So now you know how to create files and folders"
	echo "Lets learn how to delete files"
	echo "Lets delete sample-copy.txt , that we create earlier"
	type_echo "\033[0;36mType 'rm sample-copy.txt'"
	read -p "  ❯ " input

	success() {
		success_echo "Cool. You made it!"
		echo "Learn more about different flags for this command here: $(link_echo 'http://document.link')"
		rm ./sample-copy.txt
		UPDATE "mvExercise"
		SAVE_STAT
		next "mvExercise"
	}
	error() {
		restarting "rmExercise"
	}

	checkInput "$input" "$correct" success error
}

pwdExercise() {

	local input
	local correct="pwd"

	echo " "
	echo "If you want to know in which folder you now,"
	echo "you can type pwd command that display your current full path"
	echo "Lets try it"
	type_echo "Type 'pwd'"
	read -p "  ❯ " input

	success() {
		echo "Your path : $(pwd)"
		success_echo "Nice you made it!"
		echo "Learn more here: $(link_echo 'http://document.link')"
		UPDATE "sudoTraining"
		SAVE_STAT
		next "sudoTraining"
	}
	error() {
		restarting "pwdExercise"
	}

	checkInput "$input" "$correct" success error
}

cpExercise() {

	local input
	local correct="cp sample.txt sample-copy.txt"

	echo " "
	echo "Lets try cp command,"
	type_echo "Type 'cp sample.txt sample-copy.txt'"
	read -p "  ❯ " input

	success() {
		cp sample.txt sample-copy.txt
		success_echo "Yeah. All right!"
		echo "$(term_echo 'cp') command is used for copy files"
		echo "Learn more here: $(link_echo 'http://document.link')"
		UPDATE "rmExercise"
		SAVE_STAT
		next "rmExercise"
	}

	error() {
		restarting "cpExercise"
	}

	checkInput "$input" "$correct" success error
}

mvExercise() {

	local input
	local correct="mkdir testFolder; mv sample.txt ./testFolder"

	echo " "
	echo " Lets try $(term_echo 'mv') command"
	echo " Lets create new folder and move our file into that"
	echo " Note, that $(term_echo ';') is used when you want to run next command"
	echo " after first will be finished."
	echo " Learn more about $(term_echo '&& ; |') here: $(link_echo 'http://document.link')"
	type_echo " Type 'mkdir testFolder; mv sample.txt ./testFolder'"
	read -p "  ❯ " input

	success() {
		mkdir ./testFolder; mv sample.txt ./testFolder
		success_echo "Yeh. All right!"
		echo "Learn about $(term_echo 'mv') more here: $(link_echo 'http://document.link')"
		UPDATE "pwdExercise"
		SAVE_STAT
		next "pwdExercise"
	}

	error() {
		restarting "mvExercise"
	}

	checkInput "$input" "$correct" success error
}

sudoTraining() {

	local input
	local correct="sudo su"

	echo " "
	echo "If you want to run command as a super user you can use $(term_echo 'sudo') command"
	echo "Let enter a super user mode"
	error_echo "Note! Don't allow other scripts to use sudo mode. Always use sudo only when it really need!"
	echo "In our case  dont be afraid, it's only simulation of entering sudo mode. "
	echo "Learn more here: $(link_echo 'http://document.link')"
	type_echo "Type 'sudo su'"
	read -p "  ❯ " input

	success() {
		success_echo "Yeh. All right!"
		UPDATE "dateExercise"
		SAVE_STAT
		next "dateExercise"

	}

	error() {
		restarting "sudoTraining"
	}

	checkInput "$input" "$correct" success error

}

dateExercise() {

	local input
	local correct="date && date +'%d/%m/%Y'"

	echo " "
	echo "$(term_echo 'date') command is used for operate different date formats"
	echo "Lets learn it"
	echo "Note, that $(term_echo '&&') is used when you want to run two or more commands in one time"
	echo "In our case first example will show unformat date and second will show date with special formating"
	echo "You can learn more about it here : $(link_echo 'http://document.link')"
	type_echo "Type: date && date +'%d/%m/%Y'"
	read -p "  ❯ " input

	success() {
		date && date +'%d/%m/%Y'
		success_echo "Yeh. All right!"
		echo "More about $(term_echo 'date') here: $(link_echo 'http://document.link')"
		UPDATE "finish"
		SAVE_STAT
		next "lsTraining"
	}

	error() {
		restarting "dateExercise"
	}

	checkInput "$input" "$correct" success error

}

lsTraining() {
	local input
	local correct="ls ."

	echo " "
	echo "$(term_echo 'ls') command is used for showing which files current directory have"
	echo "learn more here: $(link_echo 'http://document.link')"
	echo "Lets try it"
	type_echo "Type: ls ."
	read -p " ❯  " input

	success() {
		success_echo "Yeh. All right!"
		ls .
		echo "If you want to show hidden files you can use flag -a like ls -a . This command will show files with hidden files too"
		echo "Learn more here: $(link_echo 'http://document.link')"
		UPDATE "psTraining"
		SAVE_STAT
		next "psTraining"
	}

	error() {
		restarting "lsTraining"
	}

	checkInput "$input" "$correct" success error
}

psTraining() {
	local input
	local correct="ps"

	echo " "
	echo "$(term_echo 'ps') command display a list of running processes"
	echo "Lets try"
	type_echo "Type: ps"
	read -p "  ❯ " input

	success() {
		success_echo "Cool!"
		ps
		UPDATE "psTraining"
		SAVE_STAT
		next "nanoTraining"
	}

	error() {
		restarting "psTraining"
	}

	checkInput "$input" "$correct" success error
}

nanoTraining() {
	local input
	local correct="nano"

	echo " "
	echo "Unix have a lot of terminal text editors like $(term_echo 'nano')"
	echo "Lets discover it."
	type_echo "Type: nano"
	type_echo "When you want to leave edit simple press $(term_echo 'Ctrl+X') . Than you can save or not your changes."
	read -p "  ❯ " input

	success() {
		success_echo "Cool!"
		nano
		success_echo "You made it!"
		UPDATE "finish"
		SAVE_STAT
		next "finish"
	}

	error() {
		restarting "nanoTraining"
	}

	checkInput "$input" "$correct" success error
}

# loading next state
next() {

	local state=$1
	$state
}

# show filtered path

# checking user input
checkInput() {

	local input=$1
	local success=$3
	local error=$4
	local correct=$2

	case $input in
		"$correct" ) 
				$success
			;;
		:q ) 
				echo -e "\033[0mExit script..."
				exit 1;
			;;
		:h ) 
				about
			;;
		:r ) 
				reset-dialog
			;;
		* ) 
				$error
			;;
	esac
}

# display about message
about() {
	cat <<EOF
        Usage: interactive.sh [options]
        
        Description:
            interactive-shell is a small cli app,
            that allow you to learn basics of UNIX commands
            quickly and interactively

        Authors:
        	Oleh Kuchuk <Kuchuklehjs@gmail.com>
        	https://github.com/drkraken
        	and other contributors

       	Version: 
       		current: v2.0.0
       		previous: v1.0.0
EOF
}

finish() {

	local input

	success_echo "End of game... type $(term_echo ':restart') $(success_echo 'for restarting game.')"
	error_echo "Note that all scores will be reset!"
	read -p "  ❯ " input

	if [ "$input" = ":restart" ]; then
		success_echo "restarting game..."
		DELETE_LOG "$USER";
		next "initialize"
	else
		success_echo "exiting..."
	fi
}

# restarting state on error
restarting() {

	local state=$1
	error_echo " ----------------------------------"
	error_echo "| Uncorrect input, please try again |"
	error_echo " ----------------------------------"
	$state
}

reset-dialog() {
	echo "Seriously, man? [y|N]"
	read -p "  ❯ " input

	case $input in
		y|Y ) DELETE_LOG "$USER";
			;;
		* ) exit 1;
			;;
	esac
}

# inital function
initialize() {

	echo -e "$PURPURE\\n  Holla, \033[0;33m$USER!\033[1;35m Welcome to interactive shell!"
	echo -e "  During series of short tutorials,"
	echo -e "  You will learn basics of working with your shell"
	echo -e "  So, Lets start!  $RESET"
	echo -e "  \\n  $(type_echo 'Type') \\n  $(term_echo ':q') when you would like to exit script \\n  $(term_echo ':h') for view about message  $RESET"
	echo -e "  $(term_echo ':r') if you want to reset your score  $RESET"

	success() {
		local state=$1
		success_echo " ----------------------------------"
		success_echo "|  Resuming latest game state ...  |"
		success_echo " ----------------------------------"
		next "$state"
	}

	error() {
		CREATE_USER "$USER"
		next "mkdirExercise"
	}

	CHECK_LOG "$USER" success error
}

initialize

# end