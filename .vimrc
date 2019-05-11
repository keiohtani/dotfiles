if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/ohtanikeisuke/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/ohtanikeisuke/.cache/dein')
  call dein#begin('/Users/ohtanikeisuke/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/ohtanikeisuke/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1
  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
set showcmd
set number
set cursorline
set virtualedit=onemore
set smartindent
set autoindent
set visualbell
set showmatch
set tabstop=4
set shiftwidth=4
set expandtab
syntax enable
set background=dark
colorscheme solarized
set guifont=Menlo:h15
