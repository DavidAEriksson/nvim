local ok, material = pcall(require, 'material')

if not ok then
  return
end

material.setup({
  contrast = {
    terminal = false, -- Enable contrast for the built-in terminal
    sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = false, -- Enable contrast for floating windows
    cursor_line = false, -- Enable darker background for the cursor line
    non_current_windows = false, -- Enable darker background for non-current windows
    filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
  },

  styles = { -- Give comments style such as bold, italic, underline etc.
    comments = { italic = true },
    strings = { italic = true },
    keywords = { italic = true },
    functions = { bold = true, italic = true },
    variables = {},
    operators = {},
    types = { italic = true, bold = true },
  },

  plugins = { -- Uncomment the plugins that you use to highlight them
    -- Available plugins:
    'dap',
    'dashboard',
    'gitsigns',
    'hop',
    'indent-blankline',
    'lspsaga',
    -- 'mini',
    'neogit',
    'nvim-cmp',
    -- 'nvim-navic',
    'nvim-tree',
    'nvim-web-devicons',
    -- 'sneak',
    'telescope',
    'trouble',
    'which-key',
  },

  disable = {
    colored_cursor = false, -- Disable the colored cursor
    borders = false, -- Disable borders between verticaly split windows
    background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
    term_colors = false, -- Prevent the theme from setting terminal colors
    eob_lines = false, -- Hide the end-of-buffer lines
  },

  high_visibility = {
    lighter = false, -- Enable higher contrast text for lighter style
    darker = false, -- Enable higher contrast text for darker style
  },

  lualine_style = 'stealth', -- Lualine style ( can be 'stealth' or 'default' )

  async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

  custom_colors = nil, -- If you want to everride the default colors, set this to a function

  custom_highlights = {
    TelescopePromptPrefix = {
      bg = '#7C9EAD',
    },
    TelescopePromptNormal = {
      bg = '#7C9EAD',
      fg = '#314549',
    },
    TelescopePromptTitle = {
      bg = '#7C4DFF',
      fg = '#1C2C30',
      bold = true,
      italic = true,
    },
    TelescopePromptBorder = {
      bg = '#7C9EAD',
      fg = '#7C9EAD',
    },
    TelescopeResultsNormal = {
      bg = '#395B65',
    },
    TelescopeResultsTitle = {
      bg = '#11bba3',
      fg = '#1C2C30',
      bold = true,
      italic = true,
    },
    TelescopeResultsBorder = {
      bg = '#395B65',
      fg = '#395B65',
    },
    TelescopePreviewNormal = {
      bg = '#314549',
    },
    TelescopePreviewTitle = {
      bg = '#FF5370',
      fg = '#314549',
      bold = true,
      italic = true,
    },
    TelescopePreviewBorder = {
      bg = '#314549',
      fg = '#314549',
    },
    TelescopeSelection = {
      bg = '#717CB4',
      fg = '#314549',
      italic = true,
    },
  }, -- Overwrite highlights with your own
})

vim.cmd('colorscheme material')
