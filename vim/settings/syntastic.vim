"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
" let g:syntastic_quiet_messages = {'level': 'warnings'}
" set g++ explicitly
" let g:syntastic_c_compiler = 'g++'
" dont check headers
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_c_check_header=0
let s:default_includes = [ '.', '..', '../config', 'src', 'include', 'includes',
            \ '../include', '../includes' ]
