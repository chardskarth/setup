
command! Reload execute "source ~/.config/nvim/init.vim"
command! VimColors execute "e ~/.config/nvim/config/colorscheme_vimrainbowlevels.vim"
command! Vimrc execute "e ~/.config/nvim/init.vim"
command! Vimconf execute "e ~/.config/nvim/config/general_and_my_fns.vim"
command! Vimplugins execute "e ~/.config/nvim/plugins.vim"
command! Vimkeys execute "e ~/.config/nvim/lua/whichkey2.lua"
command! VimkeysOld execute "e ~/.config/nvim/config/whichkey.vim"
command! VimwikiConf execute "e ~/.config/nvim/config/vimwiki.vim"
command! VimwikiHabits execute "e ~/vimwiki/.habits"
command! VimwikiHabitLogs execute "e ~/vimwiki/.habit-log"
command! Finances execute "e ~/Documents/financials/expenses-and-assets-06272020.txt"
command! VimQuickedits execute "e ~/.config/nvim/config/quickedits.vim"
command! VimFzfConf execute "e ~/.config/nvim/config/fzf.vim"
command! WCFeedbackForm execute "e ~/vimwiki/wc/feedbackform.wiki"


let s:istransparent = 1
function! Toggle_transparent()
	echo s:istransparent
    if s:istransparent == 0
        hi! Normal guibg=NONE
				hi! LineNr guibg=NONE 
				hi! SignColumn	guibg=NONE
				hi! StatusLineNC	guibg=NONE
				hi! TabLineFill	guibg=NONE
				hi! EndOfBuffer	guibg=NONE
        let s:istransparent = 1
    else
        set background=dark
        let s:istransparent = 0
				" let colors = onedark#GetColors()
        execute "hi! Normal guibg=#282c34"
        execute "hi! LineNr guibg=#282c34"
        execute "hi! SignColumn guibg=#282c34"
				hi! StatusLineNC	guibg=#3e4556
				hi! TabLineFill	guibg=#1c1f24 " doom-one - s:base1
				hi! EndOfBuffer	guibg=#282c34
    endif
endfunction

function! MyToggleLineNumbers() 
	set rnu!
	set number!
endfunction
