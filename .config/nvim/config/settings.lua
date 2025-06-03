vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.background = "light"
vim.opt.cmdheight = 1
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.formatoptions:remove("cro")
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true          -- Don't redraw while executing macros (good performance config)
vim.opt.magic = true               -- For regular expressions turn magic on
vim.opt.mouse = "a"
vim.opt.backup = false
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.visualbell = false
vim.opt.wb = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 999       -- always center the cursor when possible
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
vim.opt.sidescrolloff = 6
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
-- vim.opt.t_vb = ""  -- This is a Vim-specific option not available in Neovim
vim.opt.visualbell = false  -- Use this instead for no bell
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.timeoutlen = 500    -- Full name instead of abbreviated 'tm'
vim.opt.virtualedit = "onemore"
vim.opt.wildmenu = true
vim.opt.hlsearch = false

vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
    ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
    ['*'] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
  },
  cache_enabled = 0,
}
