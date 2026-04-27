return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  opts = {
    graph_style = 'unicode',
    integrations = {
      diffview = true,
    },
  },
  keys = {
    { '<leader>gs', '<cmd>Neogit<CR>', desc = '[G]it [S]tatus (Neogit)' },
    { '<leader>gfh', '<cmd>DiffviewFileHistory %<CR>', desc = '[G]it [F]ile [H]istory' },
    { '<leader>glh', ":'<,'>DiffviewFileHistory<CR>", mode = 'v', desc = '[G]it [L]ine [H]istory' },
    { '<leader>gq', '<cmd>DiffviewClose<CR>', desc = '[G]it Diff [Q]uit' },
  },
}
