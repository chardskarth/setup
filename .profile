# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


export DOTFILES_DIR=$HOME/sources/chardskarth/setup
export SOURCES_DIR=$HOME/sources/chardskarth

alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

#[ -s ~/.luaver/luaver ] && . ~/.luaver/luaver
#[ -s ~/.luaver/completions/luaver.bash ] && . ~/.luaver/completions/luaver.bash

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/pi/.sdkman"
[[ -s "/home/pi/.sdkman/bin/sdkman-init.sh" ]] && source "/home/pi/.sdkman/bin/sdkman-init.sh"

