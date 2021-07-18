" {{ rainbow settings https://jonajacek.github.io/colors
hi! rainbowlevel0 ctermfg=099|"ctermfg=068 guifg=#6699cc
hi! rainbowlevel1 ctermfg=039|"ctermfg=203 guifg=#ec5f67
hi! rainbowlevel2 ctermfg=087|"ctermfg=221 guifg=#fac863
hi! RainbowLevel3 ctermfg=46|"ctermfg=114 guifg=#99c794
hi! RainbowLevel4 ctermfg=190|"ctermfg=176 guifg=#c594c5
hi! RainbowLevel5 ctermfg=208|"ctermfg=209 guifg=#f99157
hi! RainbowLevel6 ctermfg=196|"ctermfg=073 guifg=#62b3b2
hi! RainbowLevel7 ctermfg=201|"ctermfg=137 guifg=#ab7967
" }}
let g:rainbow_active = 1

" hi! Normal ctermbg=NONE guibg=NONE 
" hi! LineNr ctermbg=NONE guibg=NONE 
hi VertSplit guibg=NONE guifg=grey50 gui=none
hi SignColumn	guibg=NONE gui=none
hi NonText guibg=NONE

highlight Conceal guifg=#80a0ff
" nnoremap <C-t> : call Toggle_transparent()<CR>

let g:doom_one_terminal_colors = v:true
set termguicolors
colorscheme doom-one
