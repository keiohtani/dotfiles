let g:projectionist_heuristics = {
  \  "*": {
  \    '*.ts': {
  \      'alternate': [
  \        '{}.html',
  \        '{}.scss',
  \        '{}.css',
  \        '{}.spec.ts'
  \      ],
  \      'type': 'source'
  \    },
  \    '*.html': {
  \      'alternate': [
  \        '{}.scss',
  \        '{}.css',
  \        '{}.spec.ts',
  \        '{}.ts'
  \      ],
  \      'type': 'html'
  \    },
  \    '*.scss': {
  \      'alternate': [
  \        '{}.spec.ts',
  \        '{}.ts',
  \        '{}.html'
  \      ],
  \      'type': 'css'
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
  \        '{}.scss',
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
