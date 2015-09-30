"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_html_checkers=['jshint', 'jscs']
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_error_symbol = "▹"
let g:syntastic_warning_symbol = "!"
