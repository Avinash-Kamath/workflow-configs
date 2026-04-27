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
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

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
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    { '<F7>', function() require('dapui').toggle() end, desc = 'Debug: See last session result.' },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = false,
      handlers = {},
      ensure_installed = {},
    }

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    ---@diagnostic disable-next-line: missing-fields
    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
      layouts = {
        {
          -- Right side: scopes, breakpoints, stacks, watches
          elements = {
            { id = 'scopes',      size = 0.4 },
            { id = 'breakpoints', size = 0.2 },
            { id = 'stacks',      size = 0.3 },
            { id = 'watches',     size = 0.1 },
          },
          size = 50,
          position = 'right',
        },
        {
          -- Bottom: repl (app logs) + console
          elements = {
            { id = 'repl',    size = 0.5 },
            { id = 'console', size = 0.5 },
          },
          size = 15,
          position = 'bottom',
        },
      },
    }

    -- Change breakpoint icons
    -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    -- local breakpoint_icons = vim.g.have_nerd_font
    --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
    --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
    -- for type, icon in pairs(breakpoint_icons) do
    --   local tp = 'Dap' .. type
    --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
    --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    -- end

    -- Red breakpoint dot
    vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreak', numhl = 'DapBreak' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '⊜', texthl = 'DapBreak', numhl = 'DapBreak' })
    vim.fn.sign_define('DapBreakpointDisabled', { text = '○', texthl = 'DapBreakDisabled', numhl = 'DapBreakDisabled' })
    vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStop', numhl = 'DapStop' })
    vim.api.nvim_set_hl(0, 'DapBreakDisabled', { fg = '#555555' })

    vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#4a3f00', bold = true })
    vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStop', linehl = 'DapStoppedLine', numhl = 'DapStop' })

    -- Enable wrap in dap-ui panels
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'dapui_scopes', 'dapui_watches', 'dapui_stacks', 'dapui_breakpoints' },
      callback = function()
        vim.wo.wrap = true
        vim.wo.linebreak = true
      end,
    })

    -- Breakpoints are loaded at startup in dap-breakpoints.lua

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Auto-open file and jump to line when breakpoint is hit
    dap.listeners.after.event_stopped['jump_to_source'] = function(session, body)
      if body.source and body.source.path and body.line then
        vim.schedule(function()
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
        detached = vim.fn.has 'win32' == 0,
      },
    }

  end,
}
