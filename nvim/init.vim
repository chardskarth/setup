
"       ___                                                         ___           ___           ___     
"      /__/\          ___                  ___        ___          /__/\         /  /\         /  /\    
"     |  |::\        /__/|                /__/\      /  /\        |  |::\       /  /::\       /  /:/    
"     |  |:|:\      |  |:|                \  \:\    /  /:/        |  |:|:\     /  /:/\:\     /  /:/     
"   __|__|:|\:\     |  |:|                 \  \:\  /__/::\      __|__|:|\:\   /  /:/~/:/    /  /:/  ___ 
"  /__/::::| \:\  __|__|:|             ___  \__\:\ \__\/\:\__  /__/::::| \:\ /__/:/ /:/___ /__/:/  /  /\
"  \  \:\~~\__\/ /__/::::\            /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/ \  \:\/:::::/ \  \:\ /  /:/
"   \  \:\          ~\~~\:\           \  \:\|  |:|     \__\::/  \  \:\        \  \::/~~~~   \  \:\  /:/ 
"    \  \:\           \  \:\           \  \:\__|:|     /__/:/    \  \:\        \  \:\        \  \:\/:/  
"     \  \:\           \__\/            \__\::::/      \__\/      \  \:\        \  \:\        \  \::/   
"      \__\/                                ~~~~                   \__\/         \__\/         \__\/     
" 

" if‧empty(glob("~/.vim/autoload/plug.vim"))↵
" ‧‧‧‧execute‧'!curl‧-fLo‧~/.vim/autoload/plug.vim‧https://raw.github.com/junegunn/vim-plug/master/plug.vim'↵
" endif↵

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif  

source $HOME/.config/nvim/plugins.vim

source $HOME/.config/nvim/config/general_and_my_fns.vim
source $HOME/.config/nvim/config/colorscheme_vimrainbowlevels.vim
source $HOME/.config/nvim/config/airline.vim
source $HOME/.config/nvim/config/coc.vim
source $HOME/.config/nvim/config/explorer.vim
source $HOME/.config/nvim/config/fzf.vim
source $HOME/.config/nvim/config/vem-tabline.vim
source $HOME/.config/nvim/config/vimwiki.vim
source $HOME/.config/nvim/config/localvimrc.vim
source $HOME/.config/nvim/config/whichkey.vim

