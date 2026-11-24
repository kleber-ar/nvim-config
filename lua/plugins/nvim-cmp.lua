return {
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
}
