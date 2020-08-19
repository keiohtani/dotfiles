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
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-plug'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'machakann/vim-highlightedyank'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'skywind3000/asyncrun.vim'
Plug 'tommcdo/vim-fubitive'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'vim-scripts/ReplaceWithRegister'

" Initialize plugin system
call plug#end()

filetype plugin indent on
syntax enable

runtime! config/plugins/*.vim

"
" one line plugin setup
"
" vim-repeat setup
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" fubitive setup
let g:fubitive_domain_pattern = 'git\.forge\.lmig\.com'
