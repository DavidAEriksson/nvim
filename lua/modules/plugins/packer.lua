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
      'ThePrimeagen/harpoon',
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
      'jose-elias-alvarez/typescript.nvim',
      'onsails/lspkind-nvim',
    })

    use({
      'glepnir/lspsaga.nvim',
      branch = 'main',
      requires = {
        { 'nvim-tree/nvim-web-devicons' },
        { 'nvim-treesitter/nvim-treesitter' },
      },
    })

    use({
      'Bekaboo/dropbar.nvim',
    })

    use({
      'jose-elias-alvarez/null-ls.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'neovim/nvim-lspconfig',
      },
    })

    use({
      'davidosomething/format-ts-errors.nvim',
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
      'CKolkey/ts-node-action',
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
      'marko-cerovac/material.nvim',
      'AlexvZyl/nordic.nvim',
      'projekt0n/github-nvim-theme',
    })

    -- Statusline
    use({
      'nvim-lualine/lualine.nvim',
      requires = {
        'nvim-web-devicons',
        opt = true,
      },
    })

    use({
      'nvim-neo-tree/neo-tree.nvim',
      branch = 'v2.x',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
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
    use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })

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

    use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })

    use({ 'mbbill/undotree' })

    use({
      'danymat/neogen',
      requires = 'nvim-treesitter/nvim-treesitter',
    })

    use({
      'zbirenbaum/neodim',
    })

    use({
      'nvim-neorg/neorg',
      run = ':Neorg sync-parsers',
      requires = 'nvim-lua/plenary.nvim',
    })

    use({
      'narutoxy/silicon.lua',
      requires = { 'nvim-lua/plenary.nvim' },
    })

    -- WHY IS THIS INSTALLED?
    use({ 'tamton-aquib/duck.nvim' })

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
