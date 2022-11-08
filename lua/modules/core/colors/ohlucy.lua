vim.g.oh_lucy_italic_functions = true
vim.g.oh_lucy_italic_comments = true
vim.g.oh_lucy_italic_keywords = true

vim.cmd([[colorscheme oh-lucy]])

vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = '#74C7A4', bg = '#21252D' })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = '#6E7380', bg = '#21252D' })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = '#74C7A4', fg = '#21252D' })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = '#21252D', fg = '#21252D' })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = '#D7D7D7' })

vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = '#343842' })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = '#E39A65', fg = '#343842' })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = '#343842', fg = '#343842' })

vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = '#272932' })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = '#AF98E6', fg = '#272932' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = '#272932', fg = '#272932' })

vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#E0828D' })

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#343842' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#343842', fg = '#343842' })

vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#74C7A4', fg = '#1B1D26' })

vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#E85A84' })
vim.api.nvim_set_hl(0, 'PMenuThumb', { bg = '#E85A84' })

vim.api.nvim_set_hl(0, 'LspFloatWinNormal', { bg = '#1B1D26' })
vim.api.nvim_set_hl(0, 'LspFloatWinBorder', { bg = '#1B1D26', fg = '#1B1D26' })
