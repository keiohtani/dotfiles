vim.g.projectionist_heuristics = {
  ["*"] = {
    ["*.ts"] = {
      alternate = {
        "{}.html",
        "{}.scss",
        "{}.css",
        "{}.spec.ts"
      },
      type = "source"
    },
    ["*.html"] = {
      alternate = {
        "{}.scss",
        "{}.css",
        "{}.spec.ts",
        "{}.ts"
      },
      type = "html"
    },
    ["*.scss"] = {
      alternate = {
        "{}.spec.ts",
        "{}.ts",
        "{}.html"
      },
      type = "css"
    },
    ["*.css"] = {
      alternate = {
        "{}.spec.ts",
        "{}.ts",
        "{}.html"
      },
      type = "css"
    },
    ["*.spec.ts"] = {
      alternate = {
        "{}.ts",
        "{}.html",
        "{}.scss",
        "{}.css"
      },
      type = "test"
    }
  }
}

vim.keymap.set('n', '<leader>aa', ':A<CR>', { noremap = true })
vim.keymap.set('n', '<leader>as', ':Esource<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ah', ':Ehtml<CR>', { noremap = true })
vim.keymap.set('n', '<leader>at', ':Etest<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ac', ':Ecss<CR>', { noremap = true })
