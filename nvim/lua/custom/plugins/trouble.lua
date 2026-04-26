return {
  'folke/trouble.nvim',
  opts = { focus = true },
  cmd = 'Trouble',
  keys = {
    { '<leader>e', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Project diagnostics' },
    { '<leader>E', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer diagnostics' },
  },
}
