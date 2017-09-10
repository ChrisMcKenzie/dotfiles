" Support for github flavored markdown
" via https://github.com/jtratner/vim-flavored-markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown
augroup END

let g:markdown_fenced_languages = ['javascript', 'go', 'php', 'sh', 'hcl']
