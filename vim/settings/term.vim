" these setting are for neovim terminal mode
nnoremap ts :split \| term <CR>
nnoremap tv :vsplit \| term <CR>

" map exit terminal mode to escape key
tnoremap <Esc> <C-\><C-n>

" allow for easy moving while in TERMINAL mode
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
