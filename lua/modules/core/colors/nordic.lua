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
    style = 'classic',
  },
  theme = 'onedark',
  nordic = {
    reduced_blue = true,
  },
})

vim.cmd('colorscheme nordic')

vim.api.nvim_set_hl(0, 'PMenu', { bg = '#282c34' })
vim.api.nvim_set_hl(0, 'PMenuSel', { bg = '#D89079', fg = '#282c34' })
vim.api.nvim_set_hl(0, 'PMenuThumb', { bg = '#D89079' })
vim.api.nvim_set_hl(0, 'Visual', { bg = '#373b43' })

--[[ vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#282c34' }) ]]
--[[ vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#282c34', fg = '#282c34' }) ]]
