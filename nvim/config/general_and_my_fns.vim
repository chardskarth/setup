" {{ aesthetic. Font, space rendering, tabstops
" indentation settings https://vim.fandom.com/wiki/Indenting_source_code?section=5

" set background=dark								" keeping here for reference but I think this setting is pointless when using a colorscheme
colorscheme hyper "medic_chalk true hyper medic_chalk sonokai pulumi spacegray
set nu rnu                             " turn on relative line numbers
set linespace=3                     " insert 3pixels per characters
set guifont=Roboto\ Mono            " Fira\ Code:h12
set list                            " turns on showing of unprintable characters. ie render whitespaces
set listchars=eol:↵,tab:›\ ,space:‧ " controlling what characters would render which spaces(eol,tab and space)
set list!                            " turns on showing of unprintable characters. ie render whitespaces
set scrolloff=10                     " max scrolling offset. scrolls whole page when remaining lines is less than the number
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
command! Vimplugins execute "e ~/.config/nvim/plugins.vim"
command! Vimkeys execute "e ~/.config/nvim/config/whichkey.vim"

function! MyGetDate() 
  put =strftime('%Y%m%d')
endfunction
