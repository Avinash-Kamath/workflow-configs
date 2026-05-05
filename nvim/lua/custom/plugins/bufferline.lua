return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  opts = {
    options = {
      icons = 'default',
      separator_style = 'slant',
      show_buffer_close_icons = false,
      show_close_icon = false,
      offsets = {
        {
          filetype = 'neo-tree',
          text = function() return vim.fn.fnamemodify(vim.fn.getcwd(), ':t') end,
          highlight = 'Directory',
          separator = true,
        },
      },
    },
    highlights = {
      buffer_selected = {
        fg = '#f5c56e',
        bold = true,
        italic = false,
      },
      indicator_selected = {
        fg = '#f5c56e',
      },
      tab_selected = {
        fg = '#f5c56e',
        bold = true,
      },
    },
  },
}
