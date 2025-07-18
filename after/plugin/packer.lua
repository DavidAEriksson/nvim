vim.cmd('packadd packer.nvim')
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local fn = vim.fn
local packer_bootstrap = nil

-- Ensure packer installed, if not, install it
---@diagnostic disable-next-line: param-type-mismatch
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
      'folke/which-key.nvim',
    })

    use({
      'folke/todo-comments.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' },
      },
    })

    -- Lsp
    use({
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'ray-x/lsp_signature.nvim',
      'onsails/lspkind-nvim',
    })
    use({
      'luckasRanarison/tailwind-tools.nvim',
      requires = { 'nvim-treesitter/nvim-treesitter' },
    })

    use({
      'nvimdev/lspsaga.nvim',
      requires = {
        { 'nvim-tree/nvim-web-devicons' },
        { 'nvim-treesitter/nvim-treesitter' },
      },
    })

    use({
      'Bekaboo/dropbar.nvim',
    })

    use({
      'dmmulroy/ts-error-translator.nvim',
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
      'chrisgrieser/nvim-scissors',
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

    -- Format
    use({ 'mhartington/formatter.nvim' })

    -- Lint
    use({ 'mfussenegger/nvim-lint' })

    --- Telescope
    use({
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-lua/popup.nvim',
        'kdheepak/lazygit.nvim',
      },
    })

    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

    -- Treesitter
    use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
    })

    use({
      'windwp/nvim-ts-autotag',
    })

    use({
      'JoosepAlviste/nvim-ts-context-commentstring',
    })

    use({
      'tpope/vim-surround',
      'windwp/nvim-autopairs',
      'NvChad/nvim-colorizer.lua',
    })

    -- Colors, indentation and blankline
    use({
      'kyazdani42/nvim-web-devicons',
      'lukas-reineke/indent-blankline.nvim',
      'AlexvZyl/nordic.nvim',
      'luisiacc/gruvbox-baby',
    })

    -- Statusline
    use({
      'nvim-lualine/lualine.nvim',
      requires = {
        'nvim-web-devicons',
        opt = true,
      },
    })

    -- File explorer
    use({
      'nvim-neo-tree/neo-tree.nvim',
      branch = 'v2.x',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
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

    -- Cokeline
    use({
      'willothy/nvim-cokeline',
      requires = { 'kyazdani42/nvim-web-devicons', 'nvim-lua/plenary.nvim' },
    })

    -- Git
    use({
      'airblade/vim-rooter',
      'APZelos/blamer.nvim',
      'lewis6991/gitsigns.nvim',
    })
    use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })

    use({ 'NeogitOrg/neogit', requires = 'nvim-lua/plenary.nvim' })

    use({
      'folke/noice.nvim',
      requires = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
        'hrsh7th/nvim-cmp',
      },
    })

    use({
      'folke/edgy.nvim',
    })

    use({
      'PatschD/zippy.nvim',
    })

    use({
      'mfussenegger/nvim-dap',
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui',
    })

    use({
      'famiu/bufdelete.nvim',
    })

    use({ 'mbbill/undotree' })

    use({
      'danymat/neogen',
      requires = 'nvim-treesitter/nvim-treesitter',
    })

    use({
      'tomiis4/hypersonic.nvim',
    })

    use({
      'github/copilot.vim',
    })

    use({
      'nyoom-engineering/oxocarbon.nvim',
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
