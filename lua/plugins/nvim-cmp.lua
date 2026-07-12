return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-emoji',
      {
        '0x100101/lab.nvim',
        build = 'cd js && npm ci',
        opts = {
          code_runner = { enabled = true },
          quick_data = { enabled = true },
        },
        keys = {
          { '<F4>', '<cmd>Lab code stop<CR>', desc = 'Lab Stop' },
          { '<F5>', '<cmd>Lab code run<CR>', desc = 'Lab Run' },
          { '<F6>', '<cmd>Lab code panel<CR>', desc = 'Lab Panel' },
        },
      },
    },

    opts = function(_, opts)
      local cmp = require('cmp')

      opts.sources = opts.sources or {}

      -- Adiciona a fonte do lab.nvim
      table.insert(opts.sources, {
        name = 'lab.quick_data',
        keyword_length = 4,
      })

      -- Adiciona emojis
      table.insert(opts.sources, {
        name = 'emoji',
      })

      -- Mantém os mapeamentos padrão e altera apenas o <CR>
      opts.mapping = vim.tbl_extend('force', opts.mapping or {}, {
        ['<CR>'] = cmp.mapping.confirm({
          select = true,
        }),
      })

      return opts
    end,
  },
}
