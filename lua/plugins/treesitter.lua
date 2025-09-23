return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'lua',
          'typescript',
          'javascript',
          'tsx',
          'json',
          'html',
          'css',
          'python',
          'bash',
          'yaml',
          'markdown',
          'markdown_inline',
        },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
      })
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    lazy = false,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
}
