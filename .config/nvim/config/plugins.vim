" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/vim-plug'
Plug 'skywind3000/asyncrun.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'christoomey/vim-system-copy'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-function'
Plug 'machakann/vim-highlightedyank'
Plug 'dkarter/bullets.vim'

" Initialize plugin system
call plug#end()

filetype plugin indent on
syntax enable