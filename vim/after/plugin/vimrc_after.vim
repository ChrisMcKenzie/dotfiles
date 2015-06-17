" https://github.com/carlhuda/janus/blob/master/janus/vim/core/janus/after/plugin/vimrc_after.vim
" Customization
"
" This loads after the janus plugins so that janus-specific plugin mappings can
" be overwritten.

hi VertSplit term=NONE ctermfg=11 ctermbg=black guifg=#515151 guibg=#000000

if filereadable(expand("~/.yadr/vim/after/.vimrc.after"))
  source ~/.yadr/vim/after/.vimrc.after
endif

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
