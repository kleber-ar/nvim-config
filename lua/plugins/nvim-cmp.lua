return {
  -- Configuração do lab.nvim
  {
    '0x100101/lab.nvim',
    enabled = true,
    run = 'cd js && npm ci', -- Executa o npm ci para instalar as dependências
    dependencies = { 'nvim-lua/plenary.nvim' }, -- Dependência do plenary
    config = function()
      -- Configuração do lab.nvim
      require('lab').setup({
        code_runner = { enabled = true },
        quick_data = { enabled = true },
      })

      -- Mapeamento de teclas
      vim.api.nvim_set_keymap('n', '<F4>', ':Lab code stop<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<F5>', ':Lab code run<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<F6>', ':Lab code panel<CR>', { noremap = true, silent = true })
    end,
  },

  -- Configuração do nvim-cmp para adicionar a fonte lab.quick_data
  {
    'hrsh7th/nvim-cmp',
    enabled = true,
    dependencies = { '0x100101/lab.nvim', 'hrsh7th/cmp-emoji' }, -- Adiciona as dependências lab.nvim e cmp-emoji
    opts = function(_, opts)
      -- Verifica se opts.sources existe e é uma tabela, caso contrário, inicializa como uma tabela vazia
      opts.sources = opts.sources or {}

      -- Adiciona a fonte 'lab.quick_data' ao nvim-cmp
      table.insert(opts.sources, {
        name = 'lab.quick_data', -- Fonte lab.quick_data
        keyword_length = 4, -- Define o comprimento mínimo para ativar o autocomplete
      })

      -- Adiciona a fonte 'emoji' ao nvim-cmp
      table.insert(opts.sources, {
        name = 'emoji', -- Fonte emoji
        insert = true, -- Habilita a inserção de emojis
      })

      -- Aqui entra o mapeamento:
      local cmp = require('cmp')
      opts.mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      })
    end,
  },
}
