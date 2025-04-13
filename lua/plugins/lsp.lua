return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'jose-elias-alvarez/typescript.nvim',
      init = function()
        require('lazyvim.util').lsp.on_attach(function(_, buffer)
          -- Configurações específicas do TypeScript
          vim.keymap.set('n', '<leader>co', 'TypescriptOrganizeImports', { buffer = buffer, desc = 'Organize Imports' })
          vim.keymap.set('n', '<leader>cR', 'TypescriptRenameFile', { desc = 'Rename File', buffer = buffer })
        end)
      end,
    },
    opts = {
      servers = {
        -- Pyright com formatação via autopep8
        pyright = {
          formatting = {
            provider = 'autopep8',
          },
        },

        -- Biome com formatação com aspas simples
        biome = {
          settings = {
            format = {
              enable = true,
              singleQuote = true,
            },
          },
        },

        -- Configuração do TypeScript com Typescript.nvim
        tsserver = {
          settings = {
            typescript = {
              format = {
                enable = true,
                singleQuote = true,
              },
            },
            javascript = {
              format = {
                enable = true,
                singleQuote = true,
              },
            },
          },
        },

        -- Configuração do LuaLS para Lua
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

        -- ESLint configurado para não formatar (somente diagnóstico)
        eslint = {
          settings = {
            format = false,
            codeActionOnSave = {
              enable = false,
              mode = 'all',
            },
            run = 'onType',
            workingDirectory = {
              mode = 'auto',
            },
          },
        },
      },
      setup = {},
    },
  },
}
