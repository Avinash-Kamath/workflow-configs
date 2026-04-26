return {
  'm00qek/baleia.nvim',
  version = '*',
  config = function()
    local baleia = require('baleia').setup {}

    -- Auto-apply to dap repl buffer
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'dap-repl',
      callback = function()
        baleia.automatically(vim.api.nvim_get_current_buf())
      end,
    })
  end,
}
