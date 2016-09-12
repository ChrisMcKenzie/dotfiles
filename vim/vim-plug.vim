" ========================================
" Vim plugin configuration
" ========================================

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/vim-plug/ "Submodules
call plug#begin('~/.vim/bundle')

" YADR's vim-plugs are split up by category into smaller files
" This reduces churn and makes it easier to fork. See
" ~/.vim/vim-plug/ to edit them:
runtime ruby.vundle
runtime languages.vundle
runtime git.vundle
runtime appearance.vundle
runtime textobjects.vundle
runtime search.vundle
runtime project.vundle
runtime vim-improvements.vundle

" The plugins listed in ~/.vim/.vundles.local will be added here to
" allow the user to add vim plugins to yadr without the need for a fork.
if filereadable(expand("~/.yadr/vim/.vim-plug.local"))
  source ~/.yadr/vim/.vim-plug.local
endif

call plug#end()
