local ok, saga = pcall(require, 'lspsaga')

if not ok then
  print('Failed to protect call LspSaga.')
  return
end

saga.setup({
  ui = {
    border = 'single',
  },
  symbol_in_winbar = {
    enable = false,
    separator = ' > ',
  },
  lightbulb = {
    enable = false,
  },
  hover = {
    max_width = 0.5,
  },
})
