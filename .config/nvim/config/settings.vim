set autoindent
set autoread
set background=light
set cmdheight=1
set cursorline
set expandtab
set formatoptions-=cro
set ignorecase
set incsearch
set lazyredraw          " Don't redraw while executing macros (good performance config)
set magic               " For regular expressions turn magic on
set mouse=a
set nobackup
set noerrorbells
set noswapfile
set novisualbell
set nowb
set nu rnu
set number relativenumber
set scrolloff=999       " always center the cursor when possible
set shiftwidth=2
set showmatch
set sidescrolloff=6
set smartcase
set smartindent
set splitbelow
set splitright
set t_vb=
set tabstop=2
set softtabstop=2
set tm=500
set virtualedit=onemore
set wildmenu
set nohlsearch

let g:clipboard = {
    \   'name': 'WslClipboard',
    \   'copy': {
    \      '+': 'clip.exe',
    \      '*': 'clip.exe',
    \    },
    \   'paste': {
    \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \   },
    \   'cache_enabled': 0,
    \ }
