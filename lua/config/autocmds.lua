local buf_en = vim.api.nvim_create_augroup('Startup', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = '*',
  command = 'set formatoptions-=cro',
  group = buf_en,
})

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  command = 'setlocal formatoptions-=cro',
  group = buf_en,
  pattern = '*',
})

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  command = 'set laststatus=3',
  group = buf_en,
  pattern = '*',
})

vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  command = 'silent! lua vim.highlight.on_yank({higroup="Visual", timeout=300})',
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = 'alpha',
  callback = function()
    vim.cmd('set laststatus=0')
  end,
})

vim.api.nvim_create_autocmd({ 'BufUnload' }, {
  buffer = 0,
  callback = function()
    vim.cmd('set laststatus=3')
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end,
})
