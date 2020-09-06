function! StartUp()                                                                                                                                                                                         
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * if !argc() | Startify | NERDTree | wincmd w | endif

"call timer_start(400, { tid ->  execute('normal NERDTree') })

" close vim when NERDTree is the only window left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

