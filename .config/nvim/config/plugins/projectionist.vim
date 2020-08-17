let g:projectionist_heuristics = {
  \  "*": {
  \    '*.ts': {
  \      'alternate': [
  \        '{}.html',
  \        '{}.css',
  \        '{}.spec.ts'
  \      ],
  \      'type': 'source'
  \    },
  \    '*.html': {
  \      'alternate': [
  \        '{}.css',
  \        '{}.spec.ts',
  \        '{}.ts'
  \      ],
  \      'type': 'html'
  \    },
  \    '*.css': {
  \      'alternate': [
  \        '{}.spec.ts',
  \        '{}.ts',
  \        '{}.html'
  \      ],
  \      'type': 'css'
  \    },
  \    '*.spec.ts': {
  \      'alternate': [
  \        '{}.ts',
  \        '{}.html',
  \        '{}.css'
  \      ],
  \      'type': 'test'
  \    }
  \  }
  \}

nnoremap <leader>aa :A<CR>
nnoremap <leader>as :Esource<CR>
nnoremap <leader>ah :Ehtml<CR>
nnoremap <leader>at :Etest<CR>
nnoremap <leader>ac :Ecss<CR>
