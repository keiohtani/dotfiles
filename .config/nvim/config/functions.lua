local function handle_url()
  local uri = vim.fn.matchstr(vim.fn.getline("."), [[[a-z]*://[^ >,;]*]])
  print(uri)
  if uri ~= "" then
    vim.fn.system("open '" .. uri .. "'")
  else
    print("No URI found in line.")
  end
end

vim.keymap.set('n', 'gx', handle_url, { noremap = true, silent = true })
