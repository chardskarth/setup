" {{ aesthetic. Font, space rendering, tabstops
" indentation settings https://vim.fandom.com/wiki/Indenting_source_code?section=5

set background=dark								" keeping here for reference but I think this setting is pointless when using a colorscheme

set timeoutlen=500
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
set mouse-=a
" }}

" TextEdit might fail if hidden is not set.
set hidden

"" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

"" Give more space for displaying messages.
set cmdheight=2

"" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"" delays and poor user experience.
set updatetime=300

"" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"" Always show the signcolumn, otherwise it would shift the text each time
"" diagnostics appear/become resolved.
if has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
set switchbuf+=useopen

set noshowmode

set rnu
set number

set completeopt=menuone,noselect

function! MyGetDate() 
  put =strftime('%Y%m%d')
endfunction

fun MyInsertWake()
  put ='[wake:<<*>>] [sleep:<<*>>] [sleepefficiency:<<*>>] [mysleeprating:<<*>>]'
endf

fun! MyJumpMove()
  "execute "normal! /<<\\*>>\<cr>"
  call feedkeys("\<esc>/<<\\*>>\<cr>c5l")
endf

