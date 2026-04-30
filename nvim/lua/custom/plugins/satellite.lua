return {
  'lewis6991/satellite.nvim',
  event = 'BufReadPost',
  opts = {
    current_only = true,
    winblend = 0, -- fully opaque so bands are clearly visible
    handlers = {
      cursor = { enable = false },
      search = { enable = true },
      diagnostic = {
        enable = true,
        signs = { '▎', '▎', '▎' }, -- solid bar for all severities
        min_severity = vim.diagnostic.severity.HINT,
      },
      gitsigns = { enable = true },
      marks = { enable = false },
    },
  },
  config = function(_, opts)
    require('satellite').setup(opts)

    -- Bold, high-contrast colours for each severity
    -- warm-burnout palette colours
    vim.api.nvim_set_hl(0, 'SatelliteDiagnosticError',   { fg = '#f06b73', bold = true })
    vim.api.nvim_set_hl(0, 'SatelliteDiagnosticWarn',    { fg = '#ffb454', bold = true })
    vim.api.nvim_set_hl(0, 'SatelliteDiagnosticInfo',    { fg = '#59c2ff', bold = true })
    vim.api.nvim_set_hl(0, 'SatelliteDiagnosticHint',    { fg = '#95e6cb', bold = true })
  end,
}
