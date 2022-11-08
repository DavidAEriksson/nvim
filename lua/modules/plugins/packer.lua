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

    use({ 'lewis6991/impatient.nvim' })

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
      'lvimuser/lsp-inlayhints.nvim',
    })

    use({
      'SmiteshP/nvim-navic',
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
      'nvim-treesitter/playground',
    })

    use({
      'windwp/nvim-ts-autotag',
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

    -- Colors, indentation and blankline
    use({
      'kyazdani42/nvim-web-devicons',
      'lukas-reineke/indent-blankline.nvim',
      --[[ 'EdenEast/nightfox.nvim', ]]
      --[[ 'Shatur/neovim-ayu', ]]
      --[[ 'rmehri01/onenord.nvim', ]]
      --[[ 'rose-pine/neovim', ]]
      --[[ 'DavidAEriksson/luna', ]]
      --[[ 'olivercederborg/poimandres.nvim', ]]
      --[[ 'morhetz/gruvbox', ]]
      --[[ 'Yazeed1s/oh-lucy.nvim', ]]
      --[[ ({ 'luisiacc/gruvbox-baby', branch = 'main' }) ]]
      --[[ ({ 'shaunsingh/oxocarbon.nvim', run = './install.sh' }) ]]
      'folke/tokyonight.nvim',
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

    -- toggleterm
    use({ 'akinsho/toggleterm.nvim' })

    -- Bufferline
    use({
      'akinsho/bufferline.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
    })

    -- Git
    use({
      'airblade/vim-rooter',
      'APZelos/blamer.nvim',
      'lewis6991/gitsigns.nvim',
    })

    use({ 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' })

    use({
      'prettier/vim-prettier',
      run = 'yarn install',
    })

    use({
      'phaazon/hop.nvim',
      branch = 'v1',
    })

    use({
      'stevearc/dressing.nvim',
    })

    use({
      'Pocco81/true-zen.nvim',
      config = function()
        require('true-zen').setup({
          integrations = {
            lualine = false,
          },
        })
      end,
    })

    use({
      'folke/noice.nvim',
      requires = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
        'hrsh7th/nvim-cmp',
      },
    })

    use({
      'nvim-neorg/neorg',
      run = ':Neorg sync-parsers',
      requires = 'nvim-lua/plenary.nvim',
    })
    use({
      'PatschD/zippy.nvim',
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
