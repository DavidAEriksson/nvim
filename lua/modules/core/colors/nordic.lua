local ok, nordic = pcall(require, 'nordic')

if not ok then
  return
end

nordic.setup({
  telescope = {
    style = 'flat',
  },
  syntax = {
    keywords = {
      italic = true,
      bold = false,
    },
  },
})

vim.cmd('colorscheme nordic')
