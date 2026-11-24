return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        -- Pyright (mantido apenas o ajuste customizado de formatação)
        pyright = {
          formatting = {
            provider = 'autopep8',
          },
        },

        -- Biome (mesclado com o extra lang.typescript.biome)
        biome = {
          settings = {
            format = {
              enable = true,
              singleQuote = true,
            },
          },
        },

        -- LuaLS (indentação customizada de 2 espaços)
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

        -- ESLint (somente diagnóstico, sem formatar, deixando o Biome/Prettier formatar)
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

        -- CSS Language Server (ignora diretivas desconhecidas como @tailwind / @apply)
        cssls = {
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
    },
  },
}
