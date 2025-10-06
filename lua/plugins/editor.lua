return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    lazy = false,
    config = function()
      require('neo-tree').setup({
        window = {
          mappings = {
            ['<cr>'] = 'open',
            ['o'] = { 'open', nowait = false },
            ['P'] = {
              'toggle_preview',
              config = {
                use_float = false,
              },
            },
          },
        },
      })
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup({
        start_in_insert = false,
        shade_terminals = false,
        size = 20,
        hide_numbers = true,
      })
    end,
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('trouble').setup()
    end,
  },
  {
    'mbbill/undotree',
  },
  {
    'famiu/bufdelete.nvim',
  },
  {
    'tpope/vim-surround',
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup()
    end,
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('todo-comments').setup()
    end,
  },
}
