" Make nerdtree look nice
let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let g:NERDTreeWinSize = 30

" Set NerdTree Toggle to Ctrl-T
map <C-t> :NERDTreeToggle<CR>

" open NERDTree when vim opens and no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if (argc() == 0 && !exists("s:std_in")) | execute ':NERDTree' | endif
" close vim if NERDTree is only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
