function! s:WindowMode()
	if g:windowModeInput ==# "+"
		wincmd +
	elseif g:windowModeInput ==# "-"
		wincmd -
	elseif g:windowModeInput ==# ">"
		wincmd >
	elseif g:windowModeInput ==# "<"
		wincmd <
	elseif g:windowModeInput ==# "r"
		wincmd r
	elseif g:windowModeInput ==# "R"
		wincmd R
	elseif g:windowModeInput ==# "="
		wincmd =
	elseif g:windowModeInput ==# "H"
		wincmd H
	elseif g:windowModeInput ==# "J"
		wincmd J
	elseif g:windowModeInput ==# "K"
		wincmd K
	elseif g:windowModeInput ==# "L"
		wincmd L
	elseif g:windowModeInput ==# " "
		TilerNew
	endif
endfunction

command! WindowMode call libmodal#Enter('Window', funcref('s:WindowMode'))
nnoremap <leader>W :WindowMode<CR>

