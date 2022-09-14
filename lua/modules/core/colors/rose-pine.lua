local bufferline = require('rose-pine.plugins.bufferline')

local colors = {
  fg = '#e0def4',
  red = '#eb6f92',
  cyan = '#9ccfd8',
  green = '#9ccfd8',
  orange = '#ea9a97',
  grey9 = '#908caa',
  grey12 = '#56526e',
  grey14 = '#393552',
  grey15 = '#2a273f',
  grey16 = '#2a283e',
}

require('rose-pine').setup({
  --- @usage 'main' | 'moon'
  dark_variant = 'moon',
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = false,
  disable_italics = false,

  --- @usage string hex value or named color from rosepinetheme.com/palette
  groups = {},
  highlights = bufferline,

  -- Change specific vim highlight groups
  highlight_groups = {
    VertSplit = { fg = colors.grey14 },
    BufferLineIndicatorSelected = { fg = colors.red, bg = colors.red },
    BufferLineFill = { fg = colors.fg, bg = colors.grey14 },

    TelescopePromptPrefix = { bg = colors.grey14 },
    TelescopePromptNormal = { bg = colors.grey14 },
    TelescopeResultsNormal = { bg = colors.grey15 },
    TelescopePreviewNormal = { bg = colors.grey16 },

    TelescopePromptBorder = { bg = colors.grey14, fg = colors.grey14 },
    TelescopeResultsBorder = { bg = colors.grey15, fg = colors.grey15 },
    TelescopePreviewBorder = { bg = colors.grey16, fg = colors.grey16 },

    TelescopePromptTitle = { fg = colors.grey14, bg = colors.orange },
    TelescopeResultsTitle = { fg = colors.grey15 },
    TelescopePreviewTitle = { fg = colors.grey16, bg = colors.orange },

    NormalFloat = { bg = colors.grey14 },
    FloatBorder = { bg = colors.grey14, fg = colors.grey14 },

    GitSignsAdd = { fg = colors.green },
    GitSignsChange = { fg = colors.orange },
    GitSignsDelete = { fg = colors.red },

    NvimTreeFolderIcon = { fg = colors.grey9 },
    NvimTreeIndentMarker = { fg = colors.grey12 },

    PmenuSel = { bg = colors.grey12 },
    Pmenu = { bg = colors.grey14 },
    PMenuThumb = { bg = colors.grey16 },

    LspFloatWinNormal = { fg = colors.fg, bg = colors.grey14 },
    LspFloatWinBorder = { fg = colors.grey14 },
    IncSearch = { fg = colors.grey14, bg = colors.orange },
  },
})

-- set colorscheme after options
vim.cmd('colorscheme rose-pine')
