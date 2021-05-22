let g:vimwiki_table_mappings=0

au BufNewFile ~/vimwiki/diary/*.wiki :silent 0r !vimwiki-diary-template '%'

command! -bang VimwikiFiles call fzf#vim#files('~/vimwiki', <bang>0)

" command! -bang -nargs=* VimwikiLines
"   \ call fzf#vim#grep(
"   \   shellescape('rg --column --line-number --no-heading --color=always --smart-case -- ~/vimwiki', 1),
"   \   fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s ~/vimwiki'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang VimwikiLines call RipgrepFzf(<q-args>, <bang>0)
