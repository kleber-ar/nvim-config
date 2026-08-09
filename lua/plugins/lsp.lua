return {
  { 'mason-org/mason-lspconfig.nvim' },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'pmizio/typescript-tools.nvim',
      'nvim-lua/plenary.nvim',
      -- NOVO BLOCO 'config' SUBSTITUINDO O 'init'
      config = function()
        vim.env.PATH = vim.fn.expand('~/.nvm/versions/node/current/bin') .. ':' .. vim.env.PATH

        -- Usa Autocmd para anexar as keymaps quando o typescript-tools for iniciado.
        vim.api.nvim_create_autocmd('LspAttach', {
          callback = function(args)
            -- Verifica se o cliente anexado é o typescript-tools (necessário por causa dos keymaps específicos)
            local client = vim.lsp.get_client_by_id(args.data.client_id)

            if client and client.name == 'typescript-tools' then
              local buffer = args.buf

              -- Configurações específicas do TypeScript
              vim.keymap.set(
                'n',
                '<leader>co',
                '<cmd>TSToolsOrganizeImports<CR>',
                { buffer = buffer, desc = 'Organize Imports' }
              )

              vim.keymap.set('n', '<leader>cR', '<cmd>TSToolsRenameFile<CR>', { buffer = buffer, desc = 'Rename File' })
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

        kotlin_language_server = {
          init_options = {
            storagePath = vim.fn.stdpath('cache') .. '/kotlin-language-server',
          },
        },

        -- Java com os imports e formatação
        jdtls = {
          cmd = {
            vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls'),
          },
          settings = {
            java = {
              format = {
                enabled = true,
              },
              saveActions = {
                organizeImports = true,
              },
              completion = {
                enabled = true,
              },
            },
          },
        },

        -- Configuração do TypeScript com typescript-tools.nvim
        ['typescript-tools'] = {
          settings = {
            separate_diagnostic_server = true,
            publish_diagnostic_on = 'insert_leave',

            expose_as_code_action = 'all',

            tsserver_file_preferences = {
              includeCompletionsForModuleExports = true,
              quotePreference = 'single',
            },

            tsserver_format_options = {
              allowIncompleteCompletions = false,
              allowRenameOfImportPath = true,
              quotePreference = 'single',
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
