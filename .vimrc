if &compatible
  set nocompatible               " Be iMproved
endif

if (!isdirectory(expand("$HOME/.cache/dein/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.cache/dein/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.cache/dein/repos/github.com/Shougo/dein.vim"))
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state($HOME . '/.cache/dein')
  call dein#begin($HOME . '/.cache/dein')

  " Add or remove your plugins here:
  let s:toml_dir  = $HOME . '/.config/nvim/'
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,{'lazy':0})
  call dein#load_toml(s:lazy_toml,{'lazy':1})
  " You can specify revision/branch/tag.

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

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
colorscheme solarized
set background=dark
nnoremap :tree :NERDTree
