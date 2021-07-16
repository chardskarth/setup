" Nerdtree, hide files on the fly
" https://www.reddit.com/r/vim/comments/541xlg/nerdtree_tip_hide_files_onthefly/

let g:MyNERDTreeIgnore=[] " List of ignored files
let ignoreSingleKeyMap = {
    \ 'key':           'dd',
    \ 'callback':      'MyNERDTreeIgnoreSingle',
    \ 'scope':         'Node',
    \ 'quickhelpText': 'Hide(ignore) the selected file' }
let unignoreAllKeyMap = {
    \ 'key':           'dua',
    \ 'callback':      'MyNERDTreeUnignoreAll',
    \ 'scope':         'Node',
    \ 'quickhelpText': 'Unhide all hidden(ignored) files' }
let unignoreSingleKeyMap = {
    \ 'key':           'dus',
    \ 'callback':      'MyNERDTreeUnignoreSingle',
    \ 'scope':         'Node',
    \ 'quickhelpText': 'Unhide a single hidden(ignored) file' }

augroup NERDTreeHide
  autocmd!
  autocmd VimEnter *  call NERDTreeAddKeyMap(ignoreSingleKeyMap) |
                    \ call NERDTreeAddKeyMap(unignoreAllKeyMap) |
                    \ call NERDTreeAddKeyMap(unignoreSingleKeyMap) |
                    \ call NERDTreeAddPathFilter('MyNERDTreeCustomFilter') 
augroup END

" Ignore Single
function MyNERDTreeIgnoreSingle(node)
  let path = a:node['path'].str()
  if index(g:MyNERDTreeIgnore, path) != -1 |  return | endif " If exists, return
  call add(g:MyNERDTreeIgnore, path) | call NERDTreeRender()
endfunction

" Unignore all
function MyNERDTreeUnignoreAll(node)
  let g:MyNERDTreeIgnore=[] | call NERDTreeRender()
endfunction

" Unignore Single
function MyNERDTreeUnignoreSingle(node)
  let promptlist = ['Select File to Unhide:', '-------------------------']
  let cntr = 1
  for i in g:MyNERDTreeIgnore
    call add(promptlist, cntr . '. ' . i) | let cntr += 1
  endfor
  call inputsave() | let fileindex = (inputlist(promptlist) - 1) | call inputrestore()
  if fileindex < 0
    echom "Invalid number (Too low)" | return
  elseif fileindex > (len(g:MyNERDTreeIgnore) - 1)
    echom "Invalid number (Too high)" | return
  endif
  call remove(g:MyNERDTreeIgnore, fileindex) | call NERDTreeRender()
endfunction
"
" Ignore Filter Function
function! MyNERDTreeCustomFilter(params)
  return (index(g:MyNERDTreeIgnore, a:params['path'].str()) != -1)
endfunction

" ----------------------------------------------------------------

function! MyNERDTreeTogglePreview()
	let g:NERDTreePreview_TemporaryToggled = g:NERDTreePreview_TemporaryToggled == 0 ? 1 : 0
endfunction
