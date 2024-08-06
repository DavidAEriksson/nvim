vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'BufRead' }, {
  pattern = { '*.md' },
  command = 'set wrap',
})
