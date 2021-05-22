let g:vimwiki_table_mappings=0

au BufNewFile ~/vimwiki/diary/*.wiki :silent 0r !vimwiki-diary-template '%'

command! -bang VimwikiFiles call fzf#vim#files('~/vimwiki', <bang>0)