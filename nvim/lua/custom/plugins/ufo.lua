return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = 'BufReadPost',
  init = function()
    -- ufo requires these to be set before the plugin loads
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.opt.foldenable = true
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
    vim.opt.foldcolumn = '0'
  end,
  opts = {
    -- use LSP first, fall back to treesitter, then indent
    provider_selector = function(_, filetype, buftype)
      -- plain buffers (terminal, prompt, etc.) get no folding
      if buftype ~= '' then return '' end
      -- treesitter with indent as fallback (indent handles any filetype)
      return { 'treesitter', 'indent' }
    end,
    open_fold_hl_timeout = 0,
    -- show number of folded lines
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = ('  %d lines'):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          table.insert(newVirtText, { chunkText, chunk[2] })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, 'MoreMsg' })
      return newVirtText
    end,
  },
  keys = {
    { 'zR', function() require('ufo').openAllFolds() end,  desc = 'Open all folds' },
    { 'zM', function() require('ufo').closeAllFolds() end, desc = 'Close all folds' },
    { 'zp', function() require('ufo').peekFoldedLinesUnderCursor() end, desc = 'Peek fold' },
  },
}
