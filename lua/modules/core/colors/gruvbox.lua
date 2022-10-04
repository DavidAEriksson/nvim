vim.cmd('colorscheme gruvbox')
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = '#eebd35', bg = '#504945' })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = '#E7D7AD', bg = '#504945' })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = '#eebd35', fg = '#282828' })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = '#504945', fg = '#504945' })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = '#1d2021' })

vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = '#1d2021' })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = '#d65d0e', fg = '#1d2021' })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = '#1d2021', fg = '#1d2021' })

vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = '#202020' })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = '#689d6a', fg = '#202020' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = '#202020', fg = '#202020' })

vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#d65d0e' })

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#504945' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#504945', fg = '#504945' })

vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#eebd35', fg = '#504945' })

vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#d65d0e' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#202020' })
vim.api.nvim_set_hl(0, 'PMenuThumb', { bg = '#d65d0e' })

vim.api.nvim_set_hl(0, 'LspFloatWinNormal', { bg = '#504945', fg = '#D4879C' })
vim.api.nvim_set_hl(0, 'LspFloatWinBorder', { bg = '#504945' })
