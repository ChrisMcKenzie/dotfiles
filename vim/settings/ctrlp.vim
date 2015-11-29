set rtp+=/usr/local/Cellar/fzf/0.9.3
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif


let g:ctrlp_working_path_mode = 2 " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open

" Default to filename searches - so that appctrl will find application
" controller
" let g:ctrlp_by_filename = 2

" Don't jump to already open window. This is annoying if you are maintaining
" several Tab workspaces and want to open two windows into the same file.
" let g:ctrlp_switch_buffer = 2

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = '<c-p>'
nnoremap <silent> <c-p> :CtrlP<CR>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>

"Cmd-Shift-(M)ethod - jump to a method (tag in current file)
"Ctrl-m is not good - it overrides behavior of Enter
nnoremap <silent> <D-M> :CtrlPBufTag<CR>
