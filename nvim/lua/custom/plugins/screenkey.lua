return {
  'NStefan002/screenkey.nvim',
  lazy = false,
  version = '*',
  opts = {
    win_opts = {
      row = vim.o.lines - vim.o.cmdheight - 1,
      col = vim.o.columns - 1,
      anchor = 'SE',
    },
    compress_after = 3,  -- compress repeated keys after 3 presses (e.g. jjjjj → j x5)
    clear_after = 3,     -- clear display after 3 seconds of inactivity
    show_leader = true,  -- show <leader> instead of the actual key
  },
  keys = {
    { '<leader>ts', '<cmd>Screenkey toggle<CR>', desc = '[T]oggle [S]creenkey' },
  },
}
