return {
  'ray-x/go.nvim',
  dependencies = {
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('go').setup({
      dap_debug = false,
      dap_debug_vt = false,
    })
  end,
  ft = { 'go', 'gomod' },
}
