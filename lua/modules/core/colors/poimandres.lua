require('poimandres').setup({})
vim.cmd('colorscheme poimandres')

-- Custom Telescope highlights
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { bg = '#303340' })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = '#303340' })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = '#5DE4C7', fg = '#303340' })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = '#303340', fg = '#303340' })

vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = '#272A33' })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = '#5DE4C7', fg = '#272A33' })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = '#272A33', fg = '#272A33' })

vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = '#2E313C' })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = '#5DE4C7', fg = '#2E313C' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = '#2E313C', fg = '#2E313C' })

vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#C398F9', fg = '#272A33' })

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#303340' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#303340', fg = '#303340' })

vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#5DE4C7', fg = '#303340' })

vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#272A33' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#2E313C' })
vim.api.nvim_set_hl(0, 'PMenuThumb', { bg = '#5DE4C7' })

vim.api.nvim_set_hl(0, 'LspFloatWinNormal', { bg = '#303340', fg = '#e4f0fb' })
vim.api.nvim_set_hl(0, 'LspFloatWinBorder', { bg = '#303340' })
