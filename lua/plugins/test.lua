return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'haydenmeade/neotest-jest',
      'marilari88/neotest-vitest',
    },
    keys = {
      {
        '<leader>tl',
        function()
          require('neotest').run.run_last()
        end,
        desc = 'Run Last Test',
      },
      {
        '<leader>tL',
        function()
          require('neotest').run.run_last({ strategy = 'dap' })
        end,
        desc = 'Debug Last Test',
      },

      {
        '<leader>tw',
        function()
          vim.cmd('split | terminal npm run test')
        end,
        desc = 'Run npm test in horizontal terminal',
      },
    },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require('neotest-jest')({
          jestCommand = 'npm test --',
          jestConfigFile = 'custom.jest.config.ts',
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )
      table.insert(opts.adapters, require('neotest-vitest'))
    end,
  },
}
