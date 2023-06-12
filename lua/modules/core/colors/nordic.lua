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
  noice = {
    style = 'flat',
  },
  theme = 'onedark',
  onedark = {
    -- Brighten the whites to fit the theme better.
    brighter_whites = true,
  },
  nordic = {
    reduced_blue = true,
  },
})

vim.cmd('colorscheme nordic')

vim.api.nvim_set_hl(0, 'PMenu', { bg = '#282c34' })
vim.api.nvim_set_hl(0, 'PMenuSel', { bg = '#D89079', fg = '#282c34' })
vim.api.nvim_set_hl(0, 'PMenuThumb', { bg = '#D89079' })
vim.api.nvim_set_hl(0, 'Visual', { bg = '#373b43' })
vim.api.nvim_set_hl(0, 'DropBarMenuCurrentContext', { bg = '#D89079' })
vim.api.nvim_set_hl(0, 'WinBar', { bg = '#1e222a' })
