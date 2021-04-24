scriptPathCJ=$(realpath "$0")
scriptDirPathCJ=$(dirname $scriptPathCJ)

vbashrc() {
	nvim ~/.bashrc
}

vcfg() {
	before=$(cat $scriptPathCJ | md5sum)
	nvim ~/.oh-my-zsh/custom/easy-configs.zsh
	after=$(cat $scriptPathCJ | md5sum)
	if [ "$before" != "$after" ]
	then
		source $scriptPathCJ
	else
		echo 'No  changes. Ignoring'
	fi
}

ccfg() {
	cat ~/.oh-my-zsh/custom/easy-configs.zsh
}

vvimrc() {
	nvim ~/.vimrc
}

vnvim() {
	nvim ~/.config/nvim
}

vzshrc() {
	nvim ~/.zshrc
}

vcfgtm() {
	nvim ~/.tmux.conf
}

cdcfg() {
	cd ~/.oh-my-zsh/custom
}

cdsrc() {
	cd ~/sources
}

cdlsrc() {
	cd ~/sources/gitlocal-raspi
}

cdgsrc() {
	cd ~/sources/github-chardskarth
}

cdsrcsetup() {
	cd ~/sources/github-chardskarth/setup
}

cdlbin() {
	cd ~/.local/bin
}

plbin() {
	echo "~/.local/bin"
}

sushutdown() {
	sudo shutdown now
}

unalias lsa
lsa() {
	ls -lah $@ | grep --color=always -v "\.$"
}

# credits to: https://stackoverflow.com/a/3572105
realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

alias -g L='| less'
alias -g G='| grep'
alias -g H='| highlight --out-format=xterm256 --force'
alias v=nvim
alias aptinst='sudo apt install '

#alias lsa='ls -lah | grep -v "\.$"'
allanpokemon () {
        while true
        do
                sleep $1
                pokemon -v | tail | awk '{print $9}'
                echo
        done
}
