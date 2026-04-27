return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = '<M-l>',
          accept_word = '<M-w>',
          accept_line = '<M-e>',
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
      },
      panel = { enabled = false },
    },
  },
  {
    'saghen/blink.cmp',
    opts = {
      sources = {
        default = { 'lsp', 'path', 'snippets' }, -- copilot removed from menu
      },
    },
  },
}
