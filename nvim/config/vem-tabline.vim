let g:vem_tabline_multiwindow_mode = 1
let g:vem_tabline_show_number='index'

"hi TabLineFill guifg=NONE guibg=NONE
"hi TabLine guifg=grey50 guibg=NONE
"hi TabLineSel guifg=NONE guibg=NONE

highlight VemTablineNormal           term=reverse cterm=none ctermfg=NONE   ctermbg=NONE guifg=NONE guibg=none gui=none
highlight VemTablineLocation         term=reverse cterm=none ctermfg=239 ctermbg=251 guifg=#666666 guibg=#cdcdcd gui=none
highlight VemTablineNumber           term=reverse cterm=none ctermfg=239 ctermbg=251 guifg=#666666 guibg=#cdcdcd gui=none
highlight VemTablineSelected         term=bold    cterm=bold ctermfg=0   ctermbg=255 guifg=#242424 guibg=#ffffff gui=bold
highlight VemTablineLocationSelected term=bold    cterm=none ctermfg=239 ctermbg=255 guifg=#666666 guibg=#ffffff gui=bold
highlight VemTablineNumberSelected   term=bold    cterm=none ctermfg=239 ctermbg=255 guifg=#666666 guibg=#ffffff gui=bold
highlight VemTablineShown            term=reverse cterm=none ctermfg=255   ctermbg=none guifg=#ffffff guibg=none gui=none
highlight VemTablineLocationShown    term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#666666 guibg=#cdcdcd gui=none
highlight VemTablineNumberShown      term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#666666 guibg=#cdcdcd gui=none
highlight VemTablineSeparator        term=reverse cterm=none ctermfg=246 ctermbg=none guifg=#888888 guibg=none gui=none
highlight VemTablinePartialName      term=reverse cterm=none ctermfg=246 ctermbg=251 guifg=#888888 guibg=#cdcdcd gui=none
highlight VemTablineTabNormal        term=reverse cterm=none ctermfg=none   ctermbg=none guifg=none guibg=none gui=none
highlight VemTablineTabSelected      term=bold    cterm=bold ctermfg=0   ctermbg=255 guifg=#242424 guibg=#ffffff gui=bold
