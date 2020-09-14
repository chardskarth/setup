let g:PLUG_PATH = '$HOME/.config/nvim/autoload/plug.vim'
let g:PLUGINS_PATH = '$HOME/.config/nvim/autoload/plug-plugins.vim'

if empty(glob(g:PLUG_PATH))
    execute '!curl‧-fLo '.g:PLUG_PATH.' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync
endif

" {{ Plugins
call plug#begin(g:PLUGINS_PATH)

" {{ Plugin: aesthetics
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes' 
" Plug 'rainglow/vim' 			> commented since I'm now using
" Plug 'NLKNguyen/papercolor-theme'	> dylanaraps' pywal
" Plug 'dylanaraps/wal.vim'
" Plug 'chrisbra/Colorizer'
Plug 'flazz/vim-colorschemes' "
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'frazrepo/vim-rainbow'
"  }}

" {{ autocomplete plugins and syntax supports
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
"  }}

" {{ miscellaneous Plugins
Plug 'scrooloose/nerdtree'
Plug 'chrisbra/recover.vim'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'senderle/restoreview' "based here:  https://vim.fandom.com/wiki/Make_views_automatic
Plug 'junegunn/vim-easy-align' " Shorthand; fetches https://github.com/junegunn/vim-easy-align
Plug 'wincent/terminus' "
Plug 'christoomey/vim-tmux-navigator' "tmux integration for ease of changing focus
Plug 'embear/vim-localvimrc'
"  }}

" {{ java, kotlin, gradle
Plug 'hdiniz/vim-gradle'
" }}

Plug 'RobertAudi/GoldenView.vim'
Plug 'neoclide/coc.nvim'
Plug 'unblevable/quick-scope'
Plug 'majutsushi/tagbar'
Plug 'zhamlin/tiler.vim'
Plug 'pacha/vem-tabline'
Plug 'ryanoasis/vim-devicons'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'mhinz/vim-startify'
Plug 'KurtPreston/vimcolors'
Plug 'liuchengxu/vim-which-key'
Plug 'vimwiki/vimwiki'
Plug 'fifi2/gtd.vim'

call plug#end()
