local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Insert mode keymap: Ctrl + ; to add ; at the end of the line and move to the next line
map('i', '<C-;>', '<Esc>A;<Esc>o', opts)

-- Insert mode keymap: Alt + ; to add ; at the end of the line
map('i', '<A-;>', '<Esc>A;<Esc>a', opts)

-- Mapeamento para abrir um terminal na horizontal e vertical com descrições
vim.api.nvim_set_keymap(
  'n',
  '<leader>th',
  ':15split | term<CR>',
  { noremap = true, silent = true, desc = 'Open horizontal terminal' }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>tv',
  ':vsplit | term<CR>',
  { noremap = true, silent = true, desc = 'Open vertical terminal' }
)

-- Mapeamento para o modo visual (V mode)
vim.api.nvim_set_keymap('v', '//', ':lua toggle_comment()<CR>', opts)
