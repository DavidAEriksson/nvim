require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'lua',
    'typescript',
    'tsx',
    'json',
    'c_sharp',
    'css',
    'html',
    'javascript',
    'markdown',
    'go',
    'rust',
  }, -- you can also do ensure_installed = 'all'
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
})
