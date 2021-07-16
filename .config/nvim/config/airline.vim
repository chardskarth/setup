let g:airline_theme='bubblegum'

let g:airline_stl_path_style = 'short'	
function! UpdateAirline()
	let g:airline_section_z = airline#section#create(['col %3v']) 
	"let g:airline_section_c = airline#section#create([fnamemodify(expand("%"), ":~:.")])
endfunction

"let g:airline_section_b = '%{getcwd()}'

"https://vi.stackexchange.com/questions/22046/how-to-remove-line-column-from-airline-section-z
"au User AirlineAfterInit  :let g:airline_section_z = airline#section#create(['%3p%% col %3v'])
au User AirlineAfterInit call UpdateAirline()
"au User AirlineAfterInit  :let g:airline_section_y = ''
":'column_number'

" remove the filetype part
" remove separators for empty sections
"let g:airline_skip_empty_sections = 1
"https://github.com/vim-airline/vim-airline/issues/1309

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#wordcount#enabled = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#wordcount#format = '%d w'
let g:airline#extensions#wordcount#formatter#default#fmt = '%d w'
let g:airline#extensions#wordcount#filetypes = ''
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0

let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'ic'  : 'δ',
    \ }

