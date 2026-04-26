return {
  'Weissle/persistent-breakpoints.nvim',
  dependencies = { 'mfussenegger/nvim-dap' },
  lazy = false,
  config = function()
    require('persistent-breakpoints').setup {
      load_breakpoints_event = { 'BufReadPost' },
    }
    -- Override breakpoint keymaps to use persistent version
    vim.keymap.set('n', '<leader>b', require('persistent-breakpoints.api').toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', require('persistent-breakpoints.api').set_conditional_breakpoint, { desc = 'Debug: Conditional Breakpoint' })

    -- Load ALL breakpoints at startup so unopened files still have breakpoints registered
    vim.schedule(function()
      local utils = require('persistent-breakpoints.utils')
      local path = utils.get_bps_path()
      local data = utils.load_bps(path)
      if vim.tbl_isempty(data) then return end
      for filepath, bps in pairs(data) do
        local bufnr = vim.fn.bufadd(filepath)
        vim.fn.bufload(bufnr)
        for _, bp in ipairs(bps) do
          require('dap.breakpoints').set({
            condition = bp.condition,
            hit_condition = bp.hit_condition,
            log_message = bp.log_message,
          }, bufnr, bp.line)
        end
      end
    end)
  end,
}
