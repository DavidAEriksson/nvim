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
    separator = ' > ',
    respect_root = true,
  },
})
