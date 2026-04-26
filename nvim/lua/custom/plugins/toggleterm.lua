return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { '<C-\\>', '<cmd>ToggleTerm<CR>', mode = { 'n', 't' }, desc = 'Toggle terminal' },
    { '<leader>tf', '<cmd>ToggleTerm direction=float<CR>',      desc = 'Terminal float' },
    { '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', desc = 'Terminal horizontal' },
    { '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>',   desc = 'Terminal vertical' },
    {
      '<leader>tg',
      function()
        local Terminal = require('toggleterm.terminal').Terminal
        Terminal:new({
          cmd = 'lazygit',
          direction = 'float',
          hidden = true,
          close_on_exit = true,
          float_opts = {
            border = 'none',
            width = function() return vim.o.columns end,
            height = function() return vim.o.lines end,
            row = 0,
            col = 0,
          },
        }):toggle()
      end,
      desc = 'Lazygit',
    },
  },
  opts = {
    size = function(term)
      if term.direction == 'horizontal' then return 15
      elseif term.direction == 'vertical' then return math.floor(vim.o.columns * 0.4)
      end
    end,
    float_opts = {
      border = 'curved',
      width = math.floor(vim.o.columns * 0.85),
      height = math.floor(vim.o.lines * 0.8),
    },
    shade_terminals = false,
    persist_mode = true,   -- remember insert/normal mode per terminal
    start_in_insert = true,
  },
}
