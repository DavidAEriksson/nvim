return {
  {
    'danymat/neogen',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('neogen').setup({
        snippet_engine = 'luasnip',
      })
    end,
  },
  {
    'PatschD/zippy.nvim',
  },
  {
    'tomiis4/hypersonic.nvim',
    event = 'CmdlineEnter',
    cmd = 'Hypersonic',
    config = function()
      require('hypersonic').setup()
    end,
  },
  -- { RIP
  --   'github/copilot.vim',
  --   config = function()
  --     vim.g.copilot_no_tab_map = true
  --     vim.g.copilot_assume_mapped = true
  --     vim.g.copilot_filetypes = { typr = false }
  --   end,
  -- },
}
