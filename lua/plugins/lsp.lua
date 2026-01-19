return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'mason.nvim' },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'ts_ls',
          'bashls',
          'pylsp',
          'lua_ls',
          'emmet_language_server',
          'yamlls',
          'eslint',
        },
      })
    end,
  },
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy',
    priority = 1000,
    config = function()
      require('tiny-inline-diagnostic').setup({
        preset = 'powerline',
      })
      vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'mason.nvim',
      'mason-lspconfig.nvim',
      'saghen/blink.cmp',
    },
    config = function()
      require('config.lsp')
    end,
    opts = { diagnostics = { virtual_text = false } },
  },
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    config = function()
      require('lsp_signature').setup()
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('lspsaga').setup({
        ui = {
          border = 'rounded',
          code_action = '',
        },
        beacon = {
          enable = false,
        },
      })
    end,
  },
  {
    'Bekaboo/dropbar.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'dmmulroy/ts-error-translator.nvim',
    config = function()
      require('ts-error-translator').setup()
    end,
  },
}
