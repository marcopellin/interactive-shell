# Run it first for installing development tools
# Installing shellcheck
shellcheck() {
	local conf

	if [ $(echo "$SHELL" | grep "bash") -ne "" ]; then
		conf=~/.bashrc
	else
		conf=~/.zshrc
	fi

	sudo apt-get install cabal-install;
	cabal update;
	cabal install cabal-install;
	git clone https://github.com/koalaman/shellcheck.git ~/;

	cd ~/shellcheck
	cabal install;
	export PATH=$HOME/.cabal/bin:$PATH
	"export PATH=$HOME/.cabal/bin:$PATH" >> $conf
}

inotify() {
	sudo apt-get install inotify-tools
}

inotify; shellcheck
