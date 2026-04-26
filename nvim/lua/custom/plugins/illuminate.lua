return {
  'RRethy/vim-illuminate',
  event = 'BufReadPost',
  opts = {
    delay = 100,
    large_file_cutoff = 2000, -- disable on files over 2000 lines for performance
    providers = { 'lsp', 'treesitter', 'regex' },
  },
  config = function(_, opts)
    require('illuminate').configure(opts)
  end,
}
