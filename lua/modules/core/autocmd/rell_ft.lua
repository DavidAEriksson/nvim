vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'BufRead' }, {
  pattern = { '*.rell' },
  command = 'set filetype=rell',
})
