local ok, ayu = pcall(require, 'ayu')

if not ok then
  return
end

ayu.setup({
  options = {
    theme = 'ayu',
  },
})

vim.cmd.colorscheme('ayu')

-- Overrides
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { bg = '#1F2430' })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = '#1F2430' })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = '#95E6CB', fg = '#1F2430' })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = '#1F2430', fg = '#1F2430' })

vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = '#232834' })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = '#95E6CB', fg = '#232834' })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = '#232834', fg = '#232834' })

vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = '#383E4C' })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = '#95E6CB', fg = '#383E4C' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = '#383E4C', fg = '#383E4C' })

vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#F27983', fg = '#232834' })

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1F2430' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#1F2430', fg = '#1F2430' })

vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#F29E74', fg = '#1F2430' })

vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#232834' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#141925' })
vim.api.nvim_set_hl(0, 'PMenuThumb', { bg = '#F27983' })

vim.api.nvim_set_hl(0, 'LspFloatWinNormal', { bg = '#1F2430', fg = '#e4f0fb' })
vim.api.nvim_set_hl(0, 'LspFloatWinBorder', { bg = '#1F2430' })
