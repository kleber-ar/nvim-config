return {
  { 'mason-org/mason-lspconfig.nvim' },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'jose-elias-alvarez/typescript.nvim',
      -- NOVO BLOCO 'config' SUBSTITUINDO O 'init'
      config = function()
        vim.env.PATH = vim.env.PATH .. ':/home/kleber/.nvm/versions/node/v20.17.0/bin'

        -- Usa Autocmd para anexar as keymaps quando o tsserver for iniciado.
        vim.api.nvim_create_autocmd('LspAttach', {
          callback = function(args)
            -- Verifica se o cliente anexado é o tsserver (necessário por causa do seu keymap específico)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client and client.name == 'tsserver' then
              local buffer = args.buf

              -- Configurações específicas do TypeScript
              vim.keymap.set(
                'n',
                '<leader>co',
                'TypescriptOrganizeImports',
                { buffer = buffer, desc = 'Organize Imports' }
              )
              vim.keymap.set('n', '<leader>cR', 'TypescriptRenameFile', { desc = 'Rename File', buffer = buffer })
            end
          end,
        })
        -- O lspconfig será configurado após este bloco, usando as opções em 'opts'
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
            nodePath = '/home/kleber/.nvm/versions/node/v20.17.0/bin',
          },
        },

        -- Configuração do CSS Language Server
        cssls = {
          cmd = { 'vscode-css-language-server', '--stdio' }, -- Garantir que o comando está correto
          filetypes = { 'css', 'scss', 'less' },
          settings = {
            css = {
              validate = true,
              lint = {
                unknownAtRules = 'ignore',
              },
            },
            scss = {
              validate = true,
              lint = {
                unknownAtRules = 'ignore',
              },
            },
            less = {
              validate = true,
              lint = {
                unknownAtRules = 'ignore',
              },
            },
          },
        },
      },

      -- Configuração do LSP e integração com nvim-cmp
      setup = {
        -- Você pode adicionar configurações adicionais aqui, se necessário
      },
    },
  },
}
