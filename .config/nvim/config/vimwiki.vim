let g:vimwiki_table_mappings=0
let g:vimwiki_url_maxsave=200

au BufNewFile ~/vimwiki/diary/*.wiki :silent 0r !vimwiki-diary-template.kts '%'
au BufNewFile ~/vimwiki/project/*.wiki :silent 0r !vimwiki-projects-template '%'
au BufNewFile ~/vimwiki/weekly/*.wiki :silent 0r !vimwiki-weekly-template.kts '%'

" TODO -- gr, ayaw gumana nito. di naseset si concealcursor
augroup VimwikiConcealcursor
autocmd!
	autocmd BufRead,BufWinEnter ~/**/*.wiki :set concealcursor=nvc
augroup END
autocmd BufWinEnter ~/**/*.wiki :set concealcursor=nvc

"  command! -bang VimwikiFiles call fzf#vim#files('~/vimwiki', <bang>0)
command! -bang VimwikiFiles call fzf#vim#files('~/vimwiki', {'options': ['--preview', 'cat {}']}, <bang>0)

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

let wcWikiList = { 'path': '~/vimwiki/whitecloak/', 'name': 'wc', 'index': '../index' }
let g:vimwiki_list = [{}, wcWikiList]

function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

function! s:SinkCallback(file)
	execute 'silent :normal! gv"zd'
	execute "silent :redir >> ".a:file." | silent echon @z | redir end"
endfunction

function! RgMoveLineTo(query, fullscreen, moveto)
  let command_fmt = 'rg -l --no-heading --color=always --smart-case %s '.a:moveto
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options':
				\		['--phony', '--query', a:query, '--bind',
				\ 'change:reload:'.reload_command],
				\ 'sink': {line -> s:SinkCallback(line)}}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -range VimwikiProjectMove <line1>,<line2>call RgMoveLineTo(<q-args>, <bang>0, '~/vimwiki/project')

command! -range VimwikiDiaryMove <line1>,<line2>call RgMoveLineTo(<q-args>, <bang>0, '~/vimwiki/diary')

command! -bang VimwikiSearchProject
    \ call fzf#vim#files("~/vimwiki/project", {'options': ['--no-multi', '--preview', 'cat {}']}, <bang>0)

command! -bang VimwikiSearchDiary
    \ call fzf#vim#files("~/vimwiki/diary", {'options': ['--preview', 'cat {}']}, <bang>0)

command! -bang VimwikiSearchCheckins
    \ call fzf#vim#files("~/vimwiki/check-in", {'options': ['--no-multi', '--preview', 'cat {}']}, <bang>0)

command! -bang VimwikiSearchWCProjects
    \ call fzf#vim#files("~/vimwiki/wc/projects", {'options': ['--no-multi', '--preview', 'cat {}']}, <bang>0)

command! -bang VimwikiSearchWeekly
    \ call fzf#vim#files("~/vimwiki/weekly", {'options': ['--no-multi', '--preview', 'cat {}']}, <bang>0)

function! MoveLineTomorrowDiary() abort
	return '~/vimwiki/diary/'.vimwiki#diary#diary_date_link(localtime() + 60*60*24).'.wiki'
endfunction

command! -range VimwikiDiaryTomorrowMove <line1>,<line2>call s:SinkCallback(MoveLineTomorrowDiary())

function! OpenDatesOfTheWeek(week)
	let datesoftheweek = systemlist("vimwiki-dates-of-the-week.kts ".a:week)
	execute "tabnew ".datesoftheweek[0]
	execute "sp".datesoftheweek[3]." \| vs ".datesoftheweek[4]." \| vs ".datesoftheweek[5]
	exec "normal \<C-w>k"
	execute "vs ".datesoftheweek[1]." \| vs ".datesoftheweek[2]
endfunction

command! -nargs=* VimwikiWeekReview call OpenDatesOfTheWeek(<q-args>)

function! TypeVimWiki() 
	call feedkeys(":VimwikiWeekReview\ ")
endfunction

function! SundayReviewFn()
	call OpenDatesOfTheWeek("")
	let weekNumber = system("date +\"%U\"") + 1
	let yearNumber = system("date +\"%Y\"") + 0
	execute "tabnew ~/vimwiki/weekly/".l:weekNumber."-".l:yearNumber.".wiki"
	call OpenDatesOfTheWeek("+1")
	
endfunction

command! SundayReview call SundayReviewFn()
