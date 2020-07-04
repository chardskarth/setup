omzr() {
	source ~/.zshrc	
}

vbashrc() {
	nvim ~/.bashrc
}

vcfg() {
	nvim ~/.oh-my-zsh/custom/easy-configs.zsh
	omzr
}

ccfg() {
	cat ~/.oh-my-zsh/custom/easy-configs.zsh
}

vvimrc() {
	nvim ~/.vimrc
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

alias -g L='| less'
alias -g G='| grep'
alias -g H='| highlight --out-format=xterm256 --force'
alias v=nvim

#alias lsa='ls -lah | grep -v "\.$"'
