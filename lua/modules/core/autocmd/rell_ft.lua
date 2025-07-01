vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'BufRead' }, {
  pattern = { '*.rell' },
  command = 'set filetype=rell',
})

-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'BufRead' }, {
--   pattern = { '*.rell' },
--   command = 'set shiftwidth=4',
-- })
