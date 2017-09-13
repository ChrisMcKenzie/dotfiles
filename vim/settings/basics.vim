set clipboard=unnamed
set laststatus=2

colorscheme chrism-eighties
set background=dark
set colorcolumn=80
set numberwidth=4
set completeopt=menu

let g:deoplete#enable_at_startup = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:gitgutter_max_signs=9999


" Relative numbers when not in insert mode
" au BufEnter * :set rnu
" au BufLeave * :set nu
" au WinEnter * :set rnu
" au WinLeave * :set nu
" au InsertEnter * :set nu
" au InsertLeave * :set rnu
au FocusLost * :set nu
au FocusGained * :set rnu
" hi VertSplit term=NONE ctermfg=11 ctermbg=11 guifg=#515151 guibg=#000000
" hi ColorColumn ctermbg=11 ctermfg=black

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

" Reload Vimrc change
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
