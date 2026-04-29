-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

---@module 'lazy'
---@type LazySpec
return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Single-window tabbed debugger UI (replaces nvim-dap-ui)
    'igorlfs/nvim-dap-view',

    -- Installs the debug adapters for you
    'mason-org/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    { '<F5>', function() require('dap').continue() end, desc = 'Debug: Start/Continue' },
    { '<F1>', function() require('dap').step_into() end, desc = 'Debug: Step Into' },
    { '<F2>', function() require('dap').step_over() end, desc = 'Debug: Step Over' },
    { '<F3>', function() require('dap').step_out() end, desc = 'Debug: Step Out' },
    { '<leader>b', function() require('dap').toggle_breakpoint() end, desc = 'Debug: Toggle Breakpoint' },
    { '<leader>B', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, desc = 'Debug: Set Breakpoint' },
    { '<F7>', '<cmd>DapViewToggle!<CR>', desc = 'Debug: Toggle dap-view' },
    { '<leader>dw', '<cmd>DapViewWatch<CR>', desc = 'Debug: Add watch expression' },
  },
  config = function()
    local dap = require 'dap'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = false,
      handlers = {},
      ensure_installed = {},
    }

    -- dap-view setup
    require('dap-view').setup {
      auto_toggle = true,
      winbar = {
        controls = { enabled = true, position = 'left' },
      },
    }

    -- Red breakpoint dot
    vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreak', numhl = 'DapBreak' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '⊜', texthl = 'DapBreak', numhl = 'DapBreak' })
    vim.fn.sign_define('DapBreakpointDisabled', { text = '○', texthl = 'DapBreakDisabled', numhl = 'DapBreakDisabled' })
    vim.api.nvim_set_hl(0, 'DapBreakDisabled', { fg = '#555555' })

    vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#4a3f00', bold = true })
    vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStop', linehl = 'DapStoppedLine', numhl = 'DapStop' })

    -- Breakpoints are loaded at startup in dap-breakpoints.lua

    -- Auto-open file and jump to line when breakpoint is hit
    dap.listeners.after.event_stopped['jump_to_source'] = function(session, body)
      if body.source and body.source.path and body.line then
        vim.schedule(function()
          -- Find a normal window without winfixbuf
          local target_win = nil
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            if not vim.wo[win].winfixbuf then
              target_win = win
              break
            end
          end
          if target_win then
            vim.api.nvim_set_current_win(target_win)
          end
          vim.cmd('edit ' .. body.source.path)
          vim.api.nvim_win_set_cursor(0, { body.line, 0 })
          vim.cmd('normal! zz')
        end)
      end
    end

    -- Install golang specific config
    require('dap-go').setup {
      delve = {
        path = vim.fn.expand('~/go/bin/dlv'),
        detached = false,
      },
    }

  end,
}
