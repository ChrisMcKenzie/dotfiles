" Make nerdtree look nice
" autocmd StdinReadPre * les6 s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let g:NERDTreeWinSize = 30

map <C-t> :NERDTreeToggle<CR>

