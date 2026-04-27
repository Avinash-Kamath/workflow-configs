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
          accept = '<S-Tab>',
          accept_word = '<C-j>',
          accept_line = '<C-e>',
          next = '<C-]>',
          prev = false,
          dismiss = false,
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
