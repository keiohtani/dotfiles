-- TextEdit might fail if hidden is not set.
vim.opt.hidden = true

-- Some servers have issues with backup files, see #649.
vim.opt.backup = false
vim.opt.writebackup = false

-- Give more space for displaying messages.
vim.opt.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
if vim.fn.has("patch-8.1.1564") == 1 then
  -- Recently vim can merge signcolumn and number column into one
  vim.opt.signcolumn = "number"
else
  vim.opt.signcolumn = "yes"
end

local function check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Example: `<leader>aap` for current paragraph
vim.keymap.set('x', '<leader>a', '<Plug>(coc-codeaction-selected)', {})
vim.keymap.set('n', '<leader>a', '<Plug>(coc-codeaction-selected)', {})

-- Mappings for CoCList
-- Show all diagnostics.
vim.keymap.set('n', '<leader>d', ':CocDiagnostics<CR>', { noremap = true })
-- Do default action for next item.
vim.keymap.set('n', '<space>j', ':<C-u>CocNext<CR>', { noremap = true, silent = true, nowait = true })
-- Do default action for previous item.
vim.keymap.set('n', '<space>k', ':<C-u>CocPrev<CR>', { noremap = true, silent = true, nowait = true })

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
vim.keymap.set('n', 'cn', '<Plug>(coc-diagnostic-next)', { silent = true })
vim.keymap.set('n', 'cp', '<Plug>(coc-diagnostic-prev)', { silent = true })

vim.keymap.set('i', '<cr>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"', { expr = true })

vim.g.coc_global_extensions = {
  'coc-tsserver',
  'coc-eslint', 
  'coc-prettier', 
  'coc-json', 
  'coc-pyright', 
  'coc-solargraph',
}

-- GoTo code navigation.
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gt', '<Plug>(coc-type-definition)', { silent = true })
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })

vim.keymap.set('n', 'K', function() show_documentation() end, { silent = true })
vim.keymap.set('n', 'gh', function() show_documentation() end, { silent = true })

function show_documentation()
  if vim.tbl_contains({'vim','help'}, vim.bo.filetype) then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  else
    vim.fn.CocAction('doHover')
  end
end

-- Highlight symbol under cursor on CursorHold
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.fn.CocActionAsync('highlight')
  end
})

-- Remap for rename current word
vim.keymap.set('n', '<leader>n', '<Plug>(coc-rename)', {})
