-- add tsserver and setup with typescript.nvim instead of lspconfig
return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'jose-elias-alvarez/typescript.nvim',
      init = function()
        require('lazyvim.util').lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set('n', '<leader>cR', 'TypescriptRenameFile', { desc = 'Rename File', buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {
          formatting = {
            provider = 'autopep8', -- ou black, conforme sua preferência
          },
        },
        -- biome will be automatically installed with mason and loaded with lspconfig
        biome = {
          settings = {
            format = {
              enable = true, -- Habilitar formatação com Biome
            },
          },
        },

        lua_ls = {
          settings = {
            Lua = {
              format = {
                defaultConfig = {
                  indent_style = 'space',
                  indent_size = 2,
                },
              },
            },
          },
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      setup = {},
    },
  },
}
