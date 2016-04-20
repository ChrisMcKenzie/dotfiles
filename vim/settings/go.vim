" BASIC PREFS
let g:go_play_open_browser = 1
let g:go_fmt_command = "goimports"
" let g:syntastic_go_checkers = ['golint', 'govet']

" SYNTAX HIGHLIGHTING
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_auto_type_info = 1

" set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow

" BASIC MAPPINGS
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>l <Plug>(go-lint)

" DEF MAPPINGS
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" DOC MAPPINGS
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

let g:go_term_mode = "vsplit"
au FileType go nmap rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)
