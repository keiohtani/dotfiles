" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'HerringtonDarkholme/yats.vim'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-system-copy'
Plug 'dkarter/bullets.vim', { 'for': 'markdown'}
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-plug'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'machakann/vim-highlightedyank'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'skywind3000/asyncrun.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'vim-scripts/ReplaceWithRegister'

" Initialize plugin system
call plug#end()

filetype plugin indent on
syntax enable

runtime! config/plugins/*.vim
