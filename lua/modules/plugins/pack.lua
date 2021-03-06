vim.cmd('packadd packer.nvim')
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local fn = vim.fn
local packer_bootstrap = nil

-- Ensure packer installed, if not, install it
if fn.empty(fn.glob(install_path, nil, 0)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
end

require('packer').init({
  compile_path = install_path .. '/packer_compiled.lua',
})

return require('packer').startup({
  function(use)
    -- Plugin manager
    use({
      'wbthomason/packer.nvim',
    })

    -- DAP
    use({
      'mfussenegger/nvim-dap',
      'Pocco81/DAPInstall.nvim',
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui',
      'nvim-telescope/telescope-dap.nvim',
      'leoluz/nvim-dap-go',
      opt = true,
      event = 'BufReadPre',
      module = { 'dap' },
      wants = { 'nvim-dap-virtual-text', 'DAPInstall.nvim', 'nvim-dap-ui', 'nvim-dap-python', 'which-key.nvim' },
    })

    -- Sanity libraries
    use({
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'ThePrimeagen/harpoon',
      'folke/which-key.nvim',
    })

    -- Lsp
    use({
      'williamboman/nvim-lsp-installer',
      'neovim/nvim-lspconfig',
      'ray-x/lsp_signature.nvim',
      'jose-elias-alvarez/nvim-lsp-ts-utils',
      'onsails/lspkind-nvim',
      'omnisharp/omnisharp-vim',
    })

    use({
      'jose-elias-alvarez/null-ls.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'neovim/nvim-lspconfig',
      },
    })

    -- Refactoring
    use({
      'ThePrimeagen/refactoring.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
      },
    })

    -- Completion
    use({
      'hrsh7th/nvim-cmp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'folke/lua-dev.nvim',
    })

    -- Trouble
    use({
      'folke/trouble.nvim',
    })

    -- Snippets
    use({
      'L3MON4D3/luasnip',
      requires = {
        'rafamadriz/friendly-snippets',
      },
    })

    --- Format/Lint
    use({ 'mhartington/formatter.nvim' })

    --- Telescope
    use({
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-lua/popup.nvim',
        'kdheepak/lazygit.nvim',
      },
    })

    use({
      'nvim-telescope/telescope-project.nvim',
      requires = {
        'nvim-telescope/telescope.nvim',
      },
    })

    --- Treesitter
    use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
    })

    use({
      'windwp/nvim-ts-autotag',
      ft = { 'typescript', 'typescriptreact' },
    })

    use({
      'numToStr/Comment.nvim',
      'JoosepAlviste/nvim-ts-context-commentstring',
    })

    use({
      'tpope/vim-surround',
      'windwp/nvim-autopairs',
      'norcalli/nvim-colorizer.lua',
    })

    -- use({
    --   'kkoomen/vim-doge',
    --   run = ':call doge#install()',
    -- })

    -- Colors, indentation and blankline
    use({
      'EdenEast/nightfox.nvim',
      'kyazdani42/nvim-web-devicons',
      'lukas-reineke/indent-blankline.nvim',
      'Shatur/neovim-ayu',
      'rmehri01/onenord.nvim',
      'rose-pine/neovim',
    })

    -- Statusline
    use({
      'nvim-lualine/lualine.nvim',
      requires = {
        'nvim-web-devicons',
        opt = true,
      },
    })

    -- Explorer
    use({
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
    })

    -- Alpha welcome screen
    use({
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function()
        require('alpha').setup(require('alpha.themes.startify').config)
      end,
    })

    -- Floating terminal
    use({
      'voldikss/vim-floaterm',
    })

    -- Bufferline
    use({
      'akinsho/bufferline.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
    })

    -- Git
    use({
      'airblade/vim-rooter',
      'tpope/vim-fugitive',
      'APZelos/blamer.nvim',
      'lewis6991/gitsigns.nvim',
    })

    use({
      'prettier/vim-prettier',
      run = 'yarn install',
    })

    use({
      'phaazon/hop.nvim',
      branch = 'v1',
    })

    use({
      'napmn/react-extract.nvim',
    })

    use({
      'stevearc/dressing.nvim',
    })

    use({
      'Pocco81/true-zen.nvim',
    })

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    },
  },
})
