" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'kien/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'christoomey/vim-system-copy'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-function'

" Initialize plugin system
call plug#end()

filetype plugin indent on
syntax enable

" Colorscheme
colorscheme solarized

" Settings
set number relativenumber
set nu rnu
set cursorline
set virtualedit=onemore
set smartindent
set autoindent
set visualbell
set noerrorbells
set smartcase
set incsearch
set showmatch
set tabstop=4
set shiftwidth=4
set expandtab
set spell
set background=light
set scrolloff=5
set sidescrolloff=6
set splitbelow
set splitright
set formatoptions-=cro

" Keymapping
let mapleader = " "
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <silent> jj <ESC>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>c :sp ~/dotfiles/vim_cheat_sheet.md<CR>

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

" open NERDTree with ctrl + n
nmap <C-n> :NERDTreeToggle<CR>

" open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree


let NERDTreeMinimalUI=1
let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#0ee375",  
    \ "Modified"  : "#d9bf91",  
    \ "Renamed"   : "#51C9FC",  
    \ "Untracked" : "#FCE77C",  
    \ "Unmerged"  : "#FC51E6",  
    \ "Dirty"     : "#FFBD61",  
    \ "Clean"     : "#87939A",   
    \ "Ignored"   : "#808080"   
    \ }              

let g:NERDTreeIgnore = ['^node_modules$']

" close vim if nerdtree is last and only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

