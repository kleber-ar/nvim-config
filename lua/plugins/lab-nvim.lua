return {
  {
    "0x100101/lab.nvim",
    run = "cd js && npm ci",
    dependencies = { "nvim-lua/plenary.nvim" }, -- usa 'dependencies' em vez de 'requires'

    config = function()
      -- Configuração do lab.nvim
      require("lab").setup({
        code_runner = { enabled = true },
        quick_data = { enabled = true },
      })

      -- Mapeamento de teclas
      vim.api.nvim_set_keymap("n", "<F4>", ":Lab code stop<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<F5>", ":Lab code run<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<F6>", ":Lab code panel<CR>", { noremap = true, silent = true })
    end,
  },

  -- Configuração do nvim-cmp para adicionar a fonte lab.quick_data
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "0x100101/lab.nvim" },
    opts = function(_, opts)
      -- Adiciona a fonte 'lab.quick_data' ao nvim-cmp
      table.insert(opts.sources, { name = "lab.quick_data", keyword_length = 4 })
    end,
  },
}
