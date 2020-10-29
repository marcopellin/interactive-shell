
states=(initialize mkdirExercise cdExercise touchExercise rmExercise pwdExercise cpExercise mvExercise sudoTraining dateExercise lsTraining psTraining nanoTraining finish)

# exrcise for learning mkdir
mkdirExercise() {

	local input
	local correct="mkdir firstFolder"

	type_echo "Type 'mkdir firstFolder'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Congratulations! Now you create your first folder!"
		echo "$(term_echo 'mkdir') command is used for creating folders"
		echo "So in our case we created folder with name 'firstFolder'"
		next
	}
	error() {
		restarting "mkdirExercise"
	}

	checkInput "$input" "$correct" success error
	
}

# exercise for learning cd
cdExercise() {

	local input
	local correct="cd firstFolder"

	success_echo "Cool! We have folder lets move into in"
	type_echo "Type 'cd firstFolder'"
	read -e -p "  ->  " input;

	success() {
		cd ./firstFolder
		success_echo "Cool. Now you in firstFolder, that you created before"
		UPDATE "touchExercise"
		SAVE_STAT
		next
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

	echo "Lets create one file in this folder"
	type_echo "\033[0;36mType 'touch sample.txt'"
	read -e -p "  -> " input

	success() {
		success_echo "Cool"
		touch ./sample.txt
		UPDATE "rmExercise"
		SAVE_STAT
		next
	}
	error() {
		restarting "touchExercise"
	}

	checkInput "$input" "$correct" success error
}

# pwd exercise
rmExercise() {

	local input
	local correct="rm sample.txt"

	echo "So now you know how to create files and folders"
	echo "Lets learn how to delete files"
	echo "Lets delete sample.txt , that we create earlier"
	type_echo "\033[0;36mType 'rm sample.txt'"
	read -e -p "  -> " input

	success() {
		success_echo "Cool. You made it!"
		# rm ./sample.txt
		UPDATE "pwdExercise"
		SAVE_STAT
		next
	}
	error() {
		restarting "rmExercise"
	}

	checkInput "$input" "$correct" success error
}

pwdExercise() {

	local input
	local correct="pwd"

	echo "If you want to know in which folder you now,"
	echo "you can type pwd command that display your current full path"
	echo "Lets try it"
	type_echo "Type 'pwd'"
	read -e -p "  -> " input

	success() {
		echo "Your path : $(pwd)"
		success_echo "Nice you made it!"
		UPDATE "cpExercise"
		SAVE_STAT
		next
	}
	error() {
		restarting "pwdExercise"
	}

	checkInput "$input" "$correct" success error
}

cpExercise() {

	local input
	local correct="cp sample.txt sample-copy.txt"

	echo "Lets try cp command,"
	type_echo "Type 'cp sample.txt sample-copy.txt'"
	read -e -p "  -> " input

	success() {
		cp sample.txt sample-copy.txt
		success_echo "Yeh. All right!"
		UPDATE "mvExercise"
		SAVE_STAT
		next
	}

	error() {
		restarting "cpExercise"
	}

	checkInput "$input" "$correct" success error
}

mvExercise() {

	local input
	local correct="mkdir testFolder; mv sample.txt ./testFolder"

	echo "Lets try $(term_echo 'mv') command"
	echo "Lets create new folder and move our file into that"
	type_echo "Type 'mkdir testFolder; mv sample.txt ./testFolder'"
	read -e -p "  -> " input

	success() {
		mkdir ./testFolder; mv sample.txt ./testFolder
		success_echo "Yeh. All right!"
		UPDATE "sudoTraining"
		SAVE_STAT
		next
	}

	error() {
		restarting "mvExercise"
	}

	checkInput "$input" "$correct" success error
}

sudoTraining() {

	local input
	local correct="sudo su"

	echo "If you want to run command as a super user you can use $(term_echo 'sudo') command"
	echo "Let enter a super user mode"
	type_echo "Type 'sudo su'"
	read -e -p "  -> " input

	success() {
		success_echo "Yeh. All right!"
		UPDATE "dateExercise"
		SAVE_STAT
		next
		
	}

	error() {
		restarting "sudoTraining"
	}

	checkInput "$input" "$correct" success error

}

dateExercise() {

	local input
	local correct="date && date +'%d/%m/%Y'"

	echo "$(term_echo 'date') command is used for operate different date formats"
	echo "Lets learn it"
	type_echo "Type: date && date +'%d/%m/%Y'"
	read -e -p "  -> " input

	success() {
		success_echo "Yeh. All right!"
		date && date +'%d/%m/%Y'
		UPDATE "finish"
		SAVE_STAT
		next
	}

	error() {
		restarting "dateExercise"
	}

	checkInput "$input" "$correct" success error

}

lsTraining() {
	local input
	local correct="ls ."

	echo "$(term_echo 'ls') command is used for showing which files current directory have"
	echo "Lets try it"
	type_echo "Type: ls ."
	read -e -p "  -> " input

	success() {
		success_echo "Yeh. All right!"
		ls .
		echo "If you want to show hidden files you can use flag -a like ls -a . This command will show files with hidden files too"
		UPDATE "lsTraining"
		SAVE_STAT
		next
	}

	error() {
		restarting "lsTraining"
	}

	checkInput "$input" "$correct" success error
}

psTraining() {
	local input
	local correct="ps"

	echo "$(term_echo 'ps') command display a list of running processes"
	echo "Lets try"
	type_echo "Type: ps"
	read -e -p "  -> " input

	success() {
		success_echo "Cool!"
		ps
		UPDATE "psTraining"
		SAVE_STAT
		next
	}

	error() {
		restarting "psTraining"
	}

	checkInput "$input" "$correct" success error
}

nanoTraining() {
	local input
	local correct="nano"

	echo "Unix have a lot of terminal text editors like $(term_echo 'nano')"
	echo "Lets discover it."
	type_echo "Type: nano"
	type_echo "When you want to leave edit simple press $(term_echo 'Ctrl+X') . Than you can save or not your changes."
	read -e -p "  -> " input

	success() {
		success_echo "Cool!"
		nano
		success_echo "You made it!"
		UPDATE "nanoTraining"
		SAVE_STAT
		next
	}

	error() {
		restarting "nanoTraining"
	}

	checkInput "$input" "$correct" success error
}

# loading next state
next() {
	UPDATE "$state"
	SAVE_STAT
	local state=$(( $state + 1 ))
	${states[$state]}
}

# checking user input
checkInput() {

	local input=$1
	local success=$3
	local error=$4
	local correct=$2
	

	if [ "$input" = "$correct" ]; then
		$success
	elif [ "$input" = ":q" ]; then
		echo -e "\033[0mExit script..."
		exit 0;
	elif [ "$input" = ":h" ]; then
		echo -e "\033[0mauthor: Marco Pellin version: 1.0"
	elif [ "$input" = ":restart" ]; then
		success_echo "restarting game..."
		DELETE_LOG "$USER";
		local state="-1"
		next
	else
		$error
	fi
}

finish() {

	local input

	success_echo "End of game... type $(term_echo ':restart') $(success_echo 'for restarting game.')"
	error_echo "Note that all scores will be reset!"
	read -e -p "  -> " input

	if [ "$input" = ":restart" ]; then
		success_echo "restarting game..."
		DELETE_LOG "$USER";
		local state="-1"
		next
	else
		success_echo "exiting..."
	fi
}

# restarting state on error
restarting() {

	local state=$1
	error_echo "\033[0;31mUncorrect input. Please, try again\033[0m"
	$state
}

# inital function
initialize() {

	echo -e "\033[1;35mHolla, \033[0;33m$USER!\033[1;35m Welcome to interactive shell! \033[0m"
	echo -e "\033[1;35mDuring series of short tutorials you will learn basics of working with your shell"
	echo -e "So, Lets start!  \033[0m"
	echo -e "Type\n :q when you would like to exit script\n :h for view script version\n :restart to clear history and begin a new game  \033[0m"

	success() {
		local state=$1
		if ! [[ $1 =~ ^[0-9]+$ ]]
		then
			local state="0"
		fi
		success_echo "Resuming latest game state ... "
		next
	}

	error() {
		CREATE_USER "$USER"
		next
	}

	CHECK_LOG "$USER" success error
}

initialize

# end
