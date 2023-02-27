local ok, nordic = pcall(require, 'nordic')

if not ok then
  return
end

local palette = require('nordic.colors').palette

nordic.setup({
  telescope = {
    style = 'flat',
  },
  bold_keywords = true,
  italic_comments = true,
  noice = {
    style = 'classic',
  },
  nordic = {
    reduced_blue = true,
  },
  override = {
    NavicSeparator = {
      bg = "#FFFFFF",
      fg = "#FFFFFF"
    },
  },
})

vim.cmd('colorscheme nordic')
