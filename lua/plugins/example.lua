return {
  -- Detecção automática de indentação (tabstop / shiftwidth)
  {
    'tpope/vim-sleuth',
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- Auto-Save (versão mantida pela comunidade compatível com Neovim moderno)
  {
    'okuuva/auto-save.nvim',
    event = { 'InsertLeave', 'TextChanged' },
    opts = {
      enabled = true,
      debounce_delay = 1000,
    },
  },

  -- Emmet para HTML/CSS/JSX
  {
    'mattn/emmet-vim',
    ft = { 'html', 'css', 'scss', 'javascriptreact', 'typescriptreact', 'astro' },
  },

  -- Parsers extras do Treesitter (estendendo os do LazyVim sem sobrescrever)
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        'astro',
        'bash',
        'c_sharp',
        'css',
        'html',
        'http',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'regex',
        'sql',
        'tsx',
        'typescript',
        'vim',
        'yaml',
      })
    end,
  },

  -- Garante que formatadores e linters extras estejam instalados no Mason
  {
    'mason-org/mason.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        'stylua',
        'shellcheck',
        'shfmt',
        'flake8',
        'biome',
      })
    end,
  },
}
