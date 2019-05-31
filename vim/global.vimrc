" try install vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" We'll allow project specific .vimrc
" and set secure to disable unsafe commands on project-specific configs
set exrc                        
set secure                      

call plug#begin('~/.vim/plugged')

" For autocompletion
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'w0rp/ale'

" For javascript
Plug 'ryanolsonx/vim-lsp-javascript'
Plug 'flowtype/vim-flow'

" For java, kotlin, gradle
Plug 'tfnico/vim-gradle'
Plug 'udalov/kotlin-vim'

" For Vim generic plugins
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'chrisbra/recover.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'breuckelen/vim-resize'
Plug 'uguu-org/vim-matrix-screensaver', { 'on': ['Matrix'] }
" Plug 'majutsushi/tagbar'
Plug 'lvht/tagbar-markdown'

call plug#end()

" indentation settings
" https://vim.fandom.com/wiki/Indenting_source_code?section=5
set autoindent                  " insert mode enter matches indentation
                                " of previous line
set smartindent                 " syntax detecting indentation
set tabstop=2                   " <TAB> occupies 2 spaces

" render whitespaces
:set listchars=eol:↵,tab:›\ ,space:‧
:set list

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=500                 "Store lots of :cmdline history set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set nowrap                      "lets not do wordwrap okay?
set hidden                      "I don't fully understand this setting yet
                                "see here:
                                "https://medium.com/usevim/vim-101-set-hidden-f78800142855a
set splitright                  ":vs opens at the right
set splitbelow                  ":split opens below
set scrolloff=20                "Keeps the screen almost vertically centered
syntax on                       "allow syntax highlighting

colorscheme spacegray
set termguicolors

if filereadable("./.vimrc")
    source ./.vimrc
endif

if filereadable("./.vim/config/plugins.vimrc")
   source ./.vim/config/plugins.vimrc 
endif

let mapleader = ";"
nmap <leader>w :w!<cr>
nmap <leader>qw :q<cr>
nmap <leader>e :e<cr>
noremap O O<Esc>
noremap o o<Esc>

map  <leader>t :NERDTreeToggle<cr>
map  <leader>tf :NERDTreeFind<cr>

map <leader>r :TagbarToggle<cr>

nmap <C-p> :FZF<cr>

vnoremap <leader>a <Esc>
inoremap <leader>a <Esc>
nnoremap <leader>a <Esc>
inoremap <leader>w <Esc>:w!<CR>
vnoremap <leader>A <Esc>
inoremap <leader>A <Esc>
nnoremap <leader>A <Esc>
inoremap <leader>W <Esc>:W!<CR>

"press // to search for visually selected text
vnoremap // y/<C-R>"<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" for asyncomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
"
" For resizing windows using arrow keys
noremap <LEFT> <C-W><
noremap <RIGHT> <C-W>>
noremap <DOWN> <C-W>-
noremap <UP> <C-W>+

" this was a useful thing in vscode: moving line/lines upp or down
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
" ∆ is ALT-j ˚ is ALT-k
nnoremap ∆ :m .+1<CR>==     
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

