-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  'mattn/emmet-vim',
  'nvim-tree/nvim-web-devicons',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'sheerun/vim-polyglot',
  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --  This is equivalent to:
  --    require('Comment').setup({})
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })

  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '┃' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
    },
  },

  -- add gruvbox
  { 'ellisonleao/gruvbox.nvim' },

  -- Configure LazyVim to load gruvbox
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'gruvbox',
    },
  },

  -- change trouble config
  {
    'folke/trouble.nvim',
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { 'folke/trouble.nvim', enabled = false },

  -- change some telescope options and a keymap to browse plugin files
  {
    'nvim-telescope/telescope.nvim',
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = { prompt_position = 'top' },
        sorting_strategy = 'ascending',
        winblend = 0,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = 'lazyvim.plugins.extras.lang.typescript' },

  -- add more treesitter parsers
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        'astro',
        'bash',
        'html',
        'http',
        'node',
        'css',
        'sql',
        'c#',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'regex',
        'tsx',
        'typescript',
        'vim',
        'yaml',
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        'tsx',
        'typescript',
      })
    end,
  },

  -- the opts function can also be used to change the default opts:
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, '😄')
    end,
  },

  -- or you can return new options to override all the defaults
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
  },

  -- use mini.starter instead of alpha
  { import = 'lazyvim.plugins.extras.ui.mini-starter' },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = 'lazyvim.plugins.extras.lang.json' },

  -- add any tools you want to have installed below
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'stylua',
        'shellcheck',
        'shfmt',
        'flake8',
        'biome',
      },
    },
  },

  {
    'Pocco81/auto-save.nvim',
    opts = {
      enabled = true,
      execution_message = 'AutoSave: saved at ' .. vim.fn.strftime('%H:%M:%S'),
      events = { 'InsertLeave', 'TextChanged' },
      conditions = {
        exists = true,
        filename_is_not = {},
        filetype_is_not = {},
        modifiable = true,
      },
      write_all_buffers = false,
      on_off_commands = true,
      clean_command_line_interval = 0,
      debounce_delay = 135,
    },
  },
}
