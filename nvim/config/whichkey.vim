"function! MyCustomOpenFile(node) abort
"	call a:node.activate({'where':'p'})
"	exec 'normal :NERDTree'
"endfunction
"
"function! MyDelayedStart(tid) abort
"	if !exists('g:loaded_nerdtree_ui_glue_autoload')
"		call timer_start(200, "MyDelayedStart")
"		return
"	endif
"	
"	call NERDTreeAddKeyMap({
"	    \ 'key': '<CR>',
"	    \ 'scope': 'FileNode',
"	    \ 'callback': 'MyCustomOpenFile',
"	    \ 'quickhelpText': 'open a file with the cursor in the NERDTree',
"	    \ 'override': 1,
"	    \ })
"endfunction
"
"
"call timer_start(200, "MyDelayedStart")

inoremap <Leader><BS> <C-w>

" for split pane navigation 
noremap! <C-J> <C-W><C-J>
noremap! <C-K> <C-W><C-K>
noremap! <C-L> <C-W><C-L>
noremap! <C-H> <C-W><C-H>

call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
set timeoutlen=300

let g:which_key_use_floating_win = 0
let g:which_key_map = {}
let g:which_key_map.1 = [':1tabnext', 'which_key_ignore']
let g:which_key_map.2 = [':2tabnext', 'which_key_ignore']
let g:which_key_map.3 = [':3tabnext', 'which_key_ignore']
let g:which_key_map.4 = [':4tabnext', 'which_key_ignore']


let g:which_key_map.w = { 'name': '+windows'
			\, 'w':['<C-W>w', 'wincmd w']
			\, 'W': ['<C-W>W', 'windcmd W']
			\, 't': ['<Plug>GoldenViewSwitchToggle', 'Golden view toggle']
			\, 's': ['<Plug>GoldenViewSplit', 'Golden view split']}

let g:which_key_map.t = { 'name': '+tagbar'
			\, 't': [':TagbarOpen fj', 'Tagbar toggle']}

let g:which_key_map.f = { 'name': '+fzf'
			\, 'p': [':FZF', 'FZF']
			\, 'g': [':GitFiles', 'Git files']
			\, 'b': [':Buffers', 'Buffers']
			\, 'x': [':BD', 'Delete buffers']}

let g:which_key_map.l = { 'name': '+languageServer'
			\, 'r': ['<Plug>(coc-references)', 'References']}
"			\ 'c': { 'name': '+vim-coc' },
"			\ }

let which_key_map.k = { 'name': '+vimwiki'
			\, 'w': [':VimwikiIndex', 'Wiki index']
			\, 'k': [':VimwikiTabIndex', 'Wiki index']
			\, 'd': [':VimwikiTabMakeDiaryNote', 'Wiki diary']}
"			\ 'c': { 'name': '+vim-coc' },
"			\ }
" {{ nerd tree settings
let g:which_key_map.e = { 'name': '+nerdtree'
			\, 'e': [':NERDTreeToggle', 'nerdtree toggle']
			\, 'f': [':NERDTreeFind', 'nerdtree find']}

" quickies
let g:which_key_map[';'] = { 'name': '+quickies' }
noremap! j; <Esc>:noh<CR>
vnoremap j; <Esc>:noh<CR>
nnoremap <leader>;x <C-w>q
nnoremap <leader>;r :Reload<CR>

noremap <leader>h <Esc>:exec "normal \<Plug>vem_prev_buffer-"<CR>
noremap <leader>l <Esc>:exec "normal \<Plug>vem_next_buffer-"<CR>

call MapBoth('noremap', '<Leader>;w', '<Esc>:noh<CR>:w<CR>')
call MapBoth('noremap', '<Leader>;ef', '<Esc>:NERDTreeFind<CR>')

call MapBoth('noremap', '<Leader>;q', '<Esc>:q<CR>') " ease of quitting, saving. both normal and insert mode
call MapBoth('noremap', '<Leader>;qqq', '<Esc>:q!<CR>')
call MapBoth('noremap', '<Leader>;ewq', '<Esc>:wq!<CR>')
