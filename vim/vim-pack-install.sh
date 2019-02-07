#!/usr/bin/env bash
# This file lives in ~/.vim/pack/install.sh
# Remember to add executable: chmod +x ~/.vim/pack/install.sh
# Reference: https://vi.stackexchange.com/a/11733/20621

common_package_path="$HOME/.vim/pack/common_pack"

# Create new folder in ~/.vim/pack that contains a start folder and cd into it.
#
# Arguments:
#   package_group, a string folder name to create and change into.
#
# Examples:
#   set_group syntax-highlighting
#
function set_group () {
  package_group=$1
  path="$HOME/.vim/pack/$package_group/start"
  mkdir -p "$path"
  cd "$path" || exit
}
# Clone or update a git repo in the current directory.
#
# Arguments:
#   repo_url, a URL to the git repo.
#
# Examples:
#   package https://github.com/tpope/vim-endwise.git
#
function package () {
  repo_url=$1
  expected_repo=$(basename "$repo_url" .git)
  if [ -d "$expected_repo" ]; then
    cd "$expected_repo" || exit
    result=$(git pull --force)
    echo "$expected_repo: $result"
  else
    echo "$expected_repo: Installing..."
    git clone -q "$repo_url"
  fi
}

(
set_group programming_auto_complete &
package https://github.com/prabirshrestha/async.vim.git &
package https://github.com/prabirshrestha/vim-lsp.git &
package https://github.com/prabirshrestha/asyncomplete.vim.git &
package https://github.com/prabirshrestha/asyncomplete-lsp.vim.git &
package https://github.com/w0rp/ale.git &
wait
) &

(
set_group javascript &
package https://github.com/ryanolsonx/vim-lsp-javascript.git &
wait
) &

(
set_group vim &
package https://github.com/scrooloose/nerdtree.git &
package https://github.com/tpope/vim-surround.git &
package https://github.com/terryma/vim-multiple-cursors.git &
package https://github.com/junegunn/fzf.vim.git &
package https://github.com/chrisbra/Recover.vim.git &
package https://github.com/vim-airline/vim-airline.git &
package https://github.com/vim-airline/vim-airline-themes.git &
package https://github.com/christoomey/vim-tmux-navigator.git &
wait
) &
wait

# (
# set_group ruby
# package https://github.com/tpope/vim-rails.git &
# package https://github.com/tpope/vim-rake.git &
# package https://github.com/tpope/vim-bundler.git &
# package https://github.com/tpope/vim-endwise.git &
# wait
# ) &
# 
# (
# set_group colorschemes
# package https://github.com/altercation/vim-colors-solarized.git &
# wait
# ) &
