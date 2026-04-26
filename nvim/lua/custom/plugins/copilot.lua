return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false }, -- handled by blink.cmp
      panel = { enabled = false },      -- handled by blink.cmp
    },
  },
  {
    'giuxtaposition/blink-cmp-copilot',
    dependencies = { 'zbirenbaum/copilot.lua' },
    specs = {
      {
        'saghen/blink.cmp',
        opts = {
          sources = {
            default = { 'lsp', 'path', 'snippets', 'copilot' },
            providers = {
              copilot = {
                name = 'copilot',
                module = 'blink-cmp-copilot',
                score_offset = 100, -- show copilot suggestions at the top
                async = true,
              },
            },
          },
        },
      },
    },
  },
}
