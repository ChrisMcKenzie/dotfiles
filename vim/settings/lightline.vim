let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename', 'modified', 'readonly'] ]
      \ },
      \ 'component': {
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \ },
      \ 'component_function': {
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive'
      \ },
      \ }

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else 
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '  '._ : ''
  endif
endfunction
