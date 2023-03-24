local ok, silicon = pcall(require, 'silicon')
if not ok then
  print('Error loading silicon')
  return
end

local curr_file = vim.fn.fnamemodify(vim.fn.expand('%:s'), ':p:~:.')

silicon.setup({
  theme = 'Nord',
  output = '~/Desktop/' .. curr_file .. '.png',
  font = 'JetBrains Mono',
})

vim.keymap.set('v', '<Leader>s', function()
  silicon.visualise_api({ to_clip = true, visible = false, show_buf = false })
end)

vim.keymap.set('v', '<Leader>ss', function()
  silicon.visualise_api({ to_clip = false, visible = false, show_buf = false })
end)
