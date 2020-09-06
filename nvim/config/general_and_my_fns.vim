" {{ aesthetic. Font, space rendering, tabstops
" indentation settings https://vim.fandom.com/wiki/Indenting_source_code?section=5

" set background=dark								" keeping here for reference but I think this setting is pointless when using a colorscheme
colorscheme hyper "medic_chalk true hyper medic_chalk sonokai pulumi spacegray
set rnu                             " turn on relative line numbers
set linespace=3                     " insert 3pixels per characters
set guifont=Roboto\ Mono            " Fira\ Code:h12
set list                            " turns on showing of unprintable characters. ie render whitespaces
set listchars=eol:↵,tab:›\ ,space:‧ " controlling what characters would render which spaces(eol,tab and space)
set list!                            " turns on showing of unprintable characters. ie render whitespaces
set scrolloff=8                     " max scrolling offset. scrolls whole page when remaining lines is less than the number
set autoindent                      " insert mode enter matches indentation of previous line
set smartindent                     " syntax detecting indentation
set tabstop=2                       " <TAB> occupies 2 spaces
set shiftwidth=2                    " just see the indentation settings above. lol
set softtabstop=2
set splitbelow splitright           " make splitting of panes more intuitive

" }}

command! Reload execute "source ~/.config/nvim/init.vim"
command! Vimrc execute "e ~/.config/nvim/init.vim"
command! Vimconf execute "e ~/.config/nvim/config/general_and_my_fns.vim"
command! VimPlugins execute "e ~/.config/nvim/plugins.vim"
command! VimKeys execute "e ~/.config/nvim/config/whichkey.vim"

" {{ Custom key mappings
function! MapBoth(mapmode, keys, rhs)
    execute 'n'.a:mapmode a:keys a:rhs
    execute 'i'.a:mapmode a:keys a:rhs
endfunction

let mapleader = " "


" resizing splits
noremap! <Esc>[1;5A <C-W>+ 
noremap! <Esc>[1;5B <C-W>-
noremap! <Esc>[1;5D <C-W>>
noremap! <Esc>[1;5C <C-W><

" formoving splits 
noremap! <C-N> <C-W>H
"noremap! <C-M> <C-W>J  " I can't remap ctrl+m. its acting the same as enter
noremap! <C-,> <C-W>K
noremap! <C-.> <C-W>L

inoremap GG <Esc>G$i

" I haven't found o and O to be a useful shortcut yet
noremap O O<Esc>
noremap o o<Esc>

" had to put bar so I coiuld add comments inline with mappings  https://stackoverflow.com/posts/24717020/revisions
nnoremap H zc|				  " close fold on current cursor
nnoremap L zo|				  " open on current cursor
nnoremap <Leader>;H zm| " decrese folding level
nnoremap <Leader>;L zr| " increase folding level

" moving text above or below. this was a useful thing in vscode
" http://vim.wikia.com/wiki/Moving_lines_up_or_down ∆ is ALT-j ˚ is ALT-k
nnoremap ∆ :m .+1<CR>==     
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv
noremap ‘ :tabnext<CR>
noremap “ :tabprev<CR>

" }}

