local ok, nordic = pcall(require, 'nordic')

if not ok then
  return
end

nordic.setup({
  telescope = {
    style = 'flat',
  },
  bold_keywords = true,
  italic_comments = true,
  reduced_blue = true,
  bright_border = false,
  noice = {
    style = 'flat',
  },
})

vim.cmd('colorscheme nordic')

vim.api.nvim_set_hl(0, 'PMenuSel', { bg = '#D89079', fg = '#282c34' })
vim.api.nvim_set_hl(0, 'PMenuThumb', { bg = '#D89079' })
vim.api.nvim_set_hl(0, 'Visual', { bg = '#EBCB8B', fg = '#242933' })
vim.api.nvim_set_hl(0, 'DropBarMenuCurrentContext', { bg = '#D89079' })
vim.api.nvim_set_hl(0, 'WinBar', { bg = '#242933' })
vim.api.nvim_set_hl(0, 'WinBarNC', { bg = '#242933' })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = '#21262f', fg = '#21262f' })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = '#1d2129', fg = '#1d2129' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = '#1d2129', fg = '#1d2129' })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = '#242933', fg = '#242933' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#242933', fg = '#D89079' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#242933' })
vim.api.nvim_set_hl(0, 'SagaNormal', { bg = '#242933' })
vim.api.nvim_set_hl(0, 'SagaBorder', { bg = '#242933', fg = '#D89079' })
