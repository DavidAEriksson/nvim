local ok, neofusion = pcall(require, 'neofusion')

if not ok then
  return
end

neofusion.setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

vim.cmd([[ colorscheme neofusion ]])

vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { bg = '#06101e' })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = '#06101e' })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = '#fd5e3d', fg = '#06101e' })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = '#06101e', fg = '#06101e' })

vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = '#06101e' })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = '#fd5e3d', fg = '#06101e' })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = '#06101e', fg = '#06101e' })

vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = '#06101e' })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = '#fd5e3d', fg = '#06101e' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = '#06101e', fg = '#06101e' })

vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#34b4ff', fg = '#06101e' })
vim.api.nvim_set_hl(0, 'WinBarNC', { bg = '#06101e' })
