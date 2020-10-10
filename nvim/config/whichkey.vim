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

let mapleader = " "
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

set timeoutlen=300

nnoremap > :tabnext<CR>
nnoremap < :tabprev<CR>

let g:which_key_use_floating_win = 0
let g:which_key_map = {}
let g:which_key_map.1 = [':VemTablineGo 1', 'which_key_ignore']
let g:which_key_map.2 = [':VemTablineGo 2', 'which_key_ignore']
let g:which_key_map.3 = [':VemTablineGo 3', 'which_key_ignore']
let g:which_key_map.4 = [':VemTablineGo 4', 'which_key_ignore']
let g:which_key_map.5 = [':VemTablineGo 5', 'which_key_ignore']
let g:which_key_map.6 = [':VemTablineGo 6', 'which_key_ignore']
let g:which_key_map.7 = [':VemTablineGo 7', 'which_key_ignore']
let g:which_key_map.8 = [':VemTablineGo 8', 'which_key_ignore']
let g:which_key_map.9 = [':VemTablineGo 9', 'which_key_ignore']


			"\, 'W':['<Plug>(submode-before-entering:window:with:<leader>W)<Plug>(submode-before-entering:window)<Plug>(submode-enter:window)', 'Window submode']
let g:which_key_map.w = { 'name': '+windows'
			\, 'n':[':TilerNew', 'Tiler new']
			\, 'r':[':TilerReorder', 'Tiler reorder']
			\, 'f':[':TilerFocus', 'Tiler focus']
			\, 't': ['<Plug>GoldenViewSwitchToggle', 'Golden view toggle']
			\, 'x': [':clo', 'Close window']
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
			\, 'k': [':VimwikiIndex', 'Wiki index']
			\, '>': [':VimwikiDiaryNextDay', 'Go next day']
			\, '<': [':VimwikiDiaryPrevDay', 'Go prev day']
			\, '.': [':VimwikiMakeDiaryNote', 'Wiki diary']
			\, 'm': { 'name': '+make diary'
			\,				't': [':VimwikiMakeTomorrowDiaryNote', 'Tomorrow']}
			\, }
"			\ 'c': { 'name': '+vim-coc' },
"			\ }
" {{ nerd tree settings

let g:which_key_map.e = { 'name': '+nerdtree'
			\, 'e': [':NERDTreeToggle', 'nerdtree toggle']
			\, 'f': [':NERDTreeFind', 'nerdtree find']}

let g:which_key_map.g = { 'name': '+gtd'
			\, 'n': [':GtdEnew', 'Create new']
			\, 'v': [':GtdReview', 'Review']
			\, 'r': [':GtdRefresh', 'Refresh']}

let g:which_key_map.i = { 'name': '+insert'
			\, 'd': [':call MyGetDate()', 'Date']
			\, 'w': [':call MyInsertWake()', 'Gtd wakeup tags']}

" quickies
let g:which_key_map[';'] = { 'name': '+quickies' }
noremap! j; <Esc>:noh<CR>
vnoremap j; <Esc>:noh<CR>
nnoremap <leader>;wx :Bdelete<CR>
nnoremap <leader>;r :Reload<CR>
inoremap <leader>;p <Esc>mzp`zi
inoremap <leader>;P <Esc>mzP`zi
nnoremap <leader>;j :call MyJumpMove()<CR>
inoremap <leader>;j <Esc>:call MyJumpMove()<CR>

function! MapBoth(mapmode, keys, rhs)
    execute 'n'.a:mapmode a:keys a:rhs
    execute 'i'.a:mapmode a:keys a:rhs
endfunction

call MapBoth('noremap', '<Leader>;w', '<Esc>:noh<CR>:w<CR>')
call MapBoth('noremap', '<Leader>;ef', '<Esc>:NERDTreeFind<CR>')

call MapBoth('noremap', '<Leader>;q', '<Esc>:q<CR>') " ease of quitting, saving. both normal and insert mode
call MapBoth('noremap', '<Leader>;qqq', '<Esc>:q!<CR>')
call MapBoth('noremap', '<Leader>;ewq', '<Esc>:wq!<CR>')

inoremap GG <Esc>G$i

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

" EasyAlign: Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" EasyAlign: Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
