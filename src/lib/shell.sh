
states=(initialize helloWorldExercise dateExercise timeExercise manExercise whatisExercise whoamiExercise pwdExercise mkdirExercise cdExercise mkdirParentExercise cdPathExercise cdMinusExercise lsExercise echoFileExercise lsListExercise mvExercise catFileExercise headExercise tailExercise appendExercise overrideExercise lsMoreExercise lsHiddenExercise hideFilesExercise rmFilesExercise touchExercise findExercise findDeleteExercise grepExercise geditExercise nanoExercise finish)

#echo Hello World
helloWorldExercise() {

	local input
	local correct="echo Hello World"

	type_echo "Hello! Would you like to say something?"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Welcome on board!"
		success_echo "$(term_echo 'echo') command is used for displaying a line of text."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#date
dateExercise() {

	local input
	local correct="date"

	type_echo "Do you know what time is it?"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Thank you! Now I know what time and date it is."
		success_echo "$(term_echo 'date') command is used for printing or setting the system date and time."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#date +%H:%M:%S
timeExercise() {

	local input
	local correct="date +%H:%M:%S"

	type_echo "I previously asked what time is it."
	type_echo "Can you please print out the time only?"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Thanks!"
		success_echo "$(term_echo 'date') command can be used with some arguments to print the current time in the given format."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#man
manExercise() {

	local input
	local correct="man date"

	type_echo "If you want to learn more about some commands, type $(term_echo 'man') followed by the name of the command."
	type_echo "Let's try this with $(term_echo 'date')."
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "I bet you barely read a couple of lines! Yeah, it was boring,"
		success_echo "but keep the $(term_echo 'man') command in mind!"
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#whatis
whatisExercise() {

	local input
	local correct="whatis date"

	type_echo "What if we want to know briefly what a command may be used for?"
	type_echo "Here it comes the $(term_echo 'whatis') command!"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Simple but effective!"
		success_echo "$(term_echo 'whatis') command displays one-line manual page descriptions."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#whoami
whoamiExercise() {

	local input
	local correct="whoami"

	type_echo "So now we know WHEN we are."
	type_echo "But do you know WHO are you?"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Excellent!"
		success_echo "$(term_echo 'whoami') command prints the effective userid."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#pwd
pwdExercise() {

	local input
	local correct="pwd"

	type_echo "Next step is to know WHERE we are."
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Yes, here we are!"
		success_echo "$(term_echo 'pwd') command prints the name of the current/working directory."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#mkdir
mkdirExercise() {

	local input
	local correct="mkdir office"

	rm -rf office

	type_echo "Better go to the office now."
	type_echo "I mean, inside the \"office\" folder!"
	type_echo "First, let's create it in here."
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Cool, you just created a new folder!"
		success_echo "$(term_echo 'mkdir') command is used to make directories."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#cd
cdExercise() {

	local input
	local correct="cd office"

	type_echo "I said we should go there now."
	type_echo "To do it we should Change Directory!"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Yes, we moved inside the office folder."
		success_echo "$(term_echo 'cd') command is used to Change the current/working Directory."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#mkdir -p
mkdirParentExercise() {

	# for resume
	#[ "$(basename $(pwd))" != "office" ] && mkdir office && cd office

	local input
	local correct="mkdir -p firstFloor/toilet"

	type_echo "Ehm, sorry, I have to go to the toilet in the first floor."
	type_echo "Can you please make it first?"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Nice, I see it is there now!"
		success_echo "$(term_echo 'mkdir -p') command makes the full set of nested directories."
		success_echo "In this example it made the toilet inside the firstFloor"
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#cd path
cdPathExercise() {

	# for resume
	#[ "$(basename $(pwd))" != "office" ] && mkdir office && cd office
	#mkdir -p firstFloor/toilet

	local input
	local correct="cd firstFloor/toilet"

	type_echo "So, please, let's move in the toilet!"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Thank you!"
		echo ""
		success_echo "Ehm..I'll be back soon!"

		for i in {1..5}
		do
			echo -n .
			sleep 1
		done
		echo ""
		echo "*flush*"
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#cd -
cdMinusExercise() {

	# for resume
	#OLDPWD=$pwd/office
	#[ "$(basename $(pwd))" != "toilet" ] && mkdir firstFloor/toilet && cd firstFloor/toilet

	local input
	local correct="cd -"

	type_echo "Thanks. Let's go back to the office!"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Yes, here we are again!"
		success_echo "$(term_echo 'cd -') command let you move back to the previous directory."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#ls
lsExercise() {

	local input
	local correct="ls"

	type_echo "Now we need a paper. Yeah, a file called paper."
	type_echo "Let's check what we have in here."
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Oh, we have just an empty office and a first floor."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#echo "..." > file
echoFileExercise() {

	local input
	local correct="echo \"\" > paper"

	type_echo "You know what? We will create an empty paper in the office!"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Yes! Here it is!"
		success_echo "Oh, can't you see it yet?"
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#ls -l
lsListExercise() {

	local input
	local correct="ls -l"

	type_echo "Please, check if the file is in there."
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "It was right there,"
		success_echo "and with $(term_echo 'ls -l') command you can even check when the file has been modified."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#mv
mvExercise() {

	local input
	local correct="mv ../car/backpack/letter ."

	type_echo "Now, I ask you a favor:"
	type_echo "I left outside, in the backpack in my car, a letter that I need for the next exercises."
	type_echo "Can you please take it in here for me?"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Thank you so much!"
		success_echo "$(term_echo 'mv') command moves files from one directory to the other."
		success_echo "Please note that the dot we used in the end of the $(term_echo 'mv') command means HERE."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#cat file
catFileExercise() {

	local input
	local correct="cat letter"

	type_echo "Let's have a look at it!"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Yes, we printed here the content of the file."
		success_echo "$(term_echo 'cat') command print files content on the standard output."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#head -n file > 
headExercise() {

	local input
	local correct="head -1 letter >> paper"

	type_echo "Now we should print the first line of the letter on our empty paper"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Let me show the content:"
		cat paper
		success_echo "$(term_echo 'head') command let you output the first part of files."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#tail -n file >
tailExercise() {

	local input
	local correct="tail -2 letter >> paper"

	type_echo "Now we should print the last two lines of the letter on our paper"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Let me show the content:"
		cat paper
		success_echo "$(term_echo 'tail') command let you output the last part of files."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

appendExercise() {

	local input
	local correct="echo \"another line\" >> paper"

	type_echo "Have you noticed something in the last two exercises?"
	type_echo "We used a double \"greater than\" sign (>>)! This means \"append\"."
	type_echo "Let's try it with $(term_echo 'echo')"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Let me show the content:"
		cat paper
		success_echo "As you can see we append it to the end of the file."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

overrideExercise() {

	local input
	local correct="echo \"test\" > paper"

	type_echo "What if we use a single \"greater than\" sign (>)?"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Let me show the content:"
		cat paper
		success_echo "As you can see the content has been fully replaced by the new text."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#ls backpack
lsMoreExercise() {

	rm -f ../car/backpack/letter

	local input
	local correct="ls ../car/backpack/"

	type_echo "Can you please check if there are other letters in my backpack?"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "It seems empty, huh?"
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#ls -a (hidden)
lsHiddenExercise() {

	rm -f ../car/backpack/letter

	local input
	local correct="ls -a ../car/backpack/"

	type_echo "I will tell you a secret: you can search for hidden files."
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Have you found it now?"
		success_echo "Remember: $(term_echo 'ls -a') let you see all files, even the hidden ones"
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#hide
hideFilesExercise() {

	local input
	local correct="mv paper .secret_paper"

	type_echo "How can we hide a file?"
	type_echo "It seems that the dot at the beginning of the name has something to do with that."
	type_echo "Let's try to hide our paper!"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Yes! Let me show you!"
		success_echo "$(term_echo 'ls -l')"
		ls -l
		success_echo "$(term_echo 'ls -al')"
		ls -al
		success_echo "Note that you can concatenate the $(term_echo '-l') and $(term_echo '-a') arguments."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#rm
rmFilesExercise() {

	local input
	local correct="rm .secret_paper"

	type_echo "We don't need the secret_paper anymore. Please burn it!"
	type_echo "Errm, remove it!"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Well done! The file is gone. Let me show you!"
		success_echo "$(term_echo 'ls -l')"
		ls -l
		success_echo "$(term_echo 'ls -al')"
		ls -al
		success_echo "$(term_echo 'rm') command removes files or directories."
		success_echo "BE CAREFUL! No confirmation is asked before the removal!"
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#touch
touchExercise() {

	local input
	local correct="touch firstFloor/toilet/toiletPaper"

	type_echo "Please, create some toilet paper in the toilet!"
	type_echo "We previously used the $(term_echo 'echo') command."
	type_echo "Let's try a new one."
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Thank you!"
		success_echo "$(term_echo 'touch') command creates an empty file if not existing."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#find
findExercise() {

	local input
	local correct="find . -name \"toiletPaper\""

	type_echo "Let search for the toilet paper from here."
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Yes, here it is!"
		success_echo "$(term_echo 'find') command searches for files in a directory hierarchy."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#find -delete
findDeleteExercise() {

	local input
	local correct="find . -name \"toiletPaper\" -delete"

	type_echo "Now we have to remove the toilet paper from the toilet."
	type_echo "We previously used the $(term_echo 'rm') command."
	type_echo "Let's try a new one."
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Yes, in one line you can search for some files and delete them!"
		success_echo "BE CAREFUL! No confirmation is asked before the removal!"
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#grep
grepExercise() {

	local input
	local correct="grep -r \"very long\" ."

	type_echo "Do you know if somewhere is written the words \"very long\"?"
	type_echo "$(term_echo 'find') won't work in this case!"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input
		success_echo "Excellent! You found it!"
		success_echo "$(term_echo 'grep') command prints lines matching a pattern."
		next
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#gedit
geditExercise() {

	currentFolder=$( basename $(pwd) )
	if [ "$currentFolder" != "office" ]
	then
		mkdir office
		cd office
	fi

	local input
	local correct="gedit letter"

	type_echo "Now please, change the words \"very long\" with \"very short\"."
	type_echo "You will use a text editor for that."
	type_echo "Remember to save before closing the editor!"
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input

		read -p "Press enter to let me know that you're done!"

		success_echo "I see you used the text editor"

		head -4 letter | tail -1 | grep "Files can be very short." letter -q
		if [ $? -eq 0 ]
		then
			success_echo "and the requested change is there!"
			next
		else
			success_echo "but the requested change is not there!"
			environment
			restarting ${states[$state]}
		fi
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

#nano
nanoExercise() {

	currentFolder=$( basename $(pwd) )
	if [ "$currentFolder" != "office" ]
	then
		mkdir office
		cd office
	fi

	local input
	local correct="nano -c letter"

	type_echo "Now please, change the words \"line by line\" with \"word by word\"."
	type_echo "You won't use $(term_echo 'gedit') now, but the more simpler $(term_echo 'nano')"
	type_echo "When you want to leave edit simple press $(term_echo 'Ctrl+X') and follow the prompt on screen."
	type_echo "Type '$correct'"
	read -e -p "  -> " input

	success() {
		eval $input

		read -p "Press enter to let me know that you're done!"

		success_echo "I see you used the text editor"

		head -3 letter | tail -1 | grep "And so on, word by word." letter -q
		if [ $? -eq 0 ]
		then
			success_echo "and the requested change is there!"
			next
		else
			success_echo "but the requested change is not there!"
			environment
			restarting ${states[$state]}
		fi
	}
	error() {
		restarting ${states[$state]}
	}

	checkInput "$input" "$correct" success error
	
}

progressBar() {

	progress=$(( ${state}00 /$(( ${#states[@]} - 1 )) / 4 ))
	empty=$(( 25 - $progress ))

	echo -e "\033[2m"
	echo -n "["

	for i in $(seq 1 $progress)
	do
		echo -n "#"
	done

	for i in $(seq 1 $empty)
	do
		echo -n " "
	done

	echo -n "] ($(( ${state}00 /$(( ${#states[@]} - 1 )) ))%)"
	echo -e "\033[0m"
}

# loading next state
next() {
	UPDATE "$state"
	SAVE_STAT
	local state=$(( $state + 1 ))
	progressBar
	${states[$state]}
}

# checking user input
checkInput() {

	local input=$1
	local success=$3
	local error=$4
	local correct=$2
	

	if [ "$input" = "$correct" ]; then
		clear
		echo ""
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

	success_echo "Yes! You completed the game!"
	success_echo "type $(term_echo ':restart') for restarting game."
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
	error_echo "\033[0;31mUncorrect input. Please, try again\033[0m"
	$1
}

# create the environment
environment() {
	mkdir -p car/backpack
	echo "This is the first line of the file.
Followed by the second of course.
And so on, line by line.
Files can be very long.
But I'm in a hurry now so I have to go!
That's the last line." > car/backpack/letter

	echo "##################
### TOP SECRET ###
##################
This is a secret file!
Please don't read further...
...because there are no more lines!" > car/backpack/.secret_letter
}

# inital function
initialize() {

	environment

	clear

	echo -e "\033[1;35mHola, \033[0;33m$USER!\033[1;35m Welcome to interactive shell! \033[0m"
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
