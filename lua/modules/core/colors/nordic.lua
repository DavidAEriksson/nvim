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
  nordic = {
    reduced_blue = true,
  },
  override = {
    NormalFloat = {
      bg = '#191C24',
    },
  },
})

vim.cmd('colorscheme nordic')
