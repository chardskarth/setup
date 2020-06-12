omzr() {
source ~/.zshrc	
}

vcfg() {
	nvim ~/.oh-my-zsh/custom/easy-configs.zsh
	omzr
}

vvimrc() {
	nvim ~/.vimrc
}

vzshrc() {
	nvim ~/.zshrc
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

ta() {
	tmux attach
}

alias -g L='| less'
alias -g G='| grep'
alias v=nvim
