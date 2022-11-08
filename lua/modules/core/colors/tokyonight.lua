local ok, tokyonight = pcall(require, 'tokyonight')

if not ok then
  return
end

tokyonight.setup({
  style = 'night',
  styles = {
    functions = { bold = true },
  },
  lualine_bold = true,
})

vim.cmd([[colorscheme tokyonight]])

vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = '#449dab', bg = '#414868' })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = '#6E7380', bg = '#414868' })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = '#449dab', fg = '#414868' })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = '#414868', fg = '#414868' })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = '#c0caf5' })

vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = '#292e42' })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = '#ff9e64', fg = '#292e42' })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = '#292e42', fg = '#292e42' })

vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = '#1f2335' })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = '#bb9af7', fg = '#1f2335' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = '#1f2335', fg = '#1f2335' })

vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = '#292e42', bg = '#449dab' })

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#292e42' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#292e42', fg = '#292e42' })

vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#f7768e' })
vim.api.nvim_set_hl(0, 'PMenuThumb', { bg = '#f7768e' })

vim.api.nvim_set_hl(0, 'LspFloatWinNormal', { bg = '#1f2335' })
vim.api.nvim_set_hl(0, 'LspFloatWinBorder', { bg = '#1f2335', fg = '#1f2335' })
