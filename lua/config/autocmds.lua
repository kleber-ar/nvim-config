-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.o.linebreak = true
vim.o.wrap = true

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.js', '*.ts', '*.py', '*.lua', '*.html', '*.css' },
  -- Ajuste os padrões de arquivo conforme necessário
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
