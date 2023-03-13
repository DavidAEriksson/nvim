vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.norg' },
  command = 'set conceallevel=3',
})
