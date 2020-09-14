#! /bin/bash

if [ -z "${HOME+x}" ]; then
	echo "\$HOME variable is not set. exiting"
	exit 1
fi

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"

# zshrc and powerline theme config
ln -sf $DIR/zsh/zshrc $HOME/.zshrc
ln -sf $DIR/zsh/p10k.zsh $HOME/.p10k.zsh

# Move remaining file to oh-my-zsh/custom folder
ZSHPATH=$HOME/.oh-my-zsh
ls -lah $DIR/zsh | grep -v -e zshrc$ -e p10k -e \\.$ | awk '{print $9}' | xargs -I{} ln -sf $DIR/zsh/{} $ZSHPATH/custom/{}

# vim, tmux
ln -sf $DIR/vim/vimrc $HOME/.vimrc
ln -sf $DIR/tmux/tmux.conf $HOME/.tmux.conf

# nvim for linux
find $DIR/nvim -type f -not -path $DIR'/nvim/autoload/*' -printf '%P\n' | xargs -I{} ln -sf $DIR/nvim/{} $HOME/.config/nvim/{}

# nvim install for macos
# find $DIR/nvim -type f -not -path $DIR'/nvim/autoload/*' -exec stat -f "%N" {} \; | sed $(echo 's#'$DIR'##g') | xargs -I{} ln -sf $DIR{} $HOME/.config{}


