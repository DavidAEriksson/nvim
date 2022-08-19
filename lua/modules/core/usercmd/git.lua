vim.api.nvim_create_user_command('Git', function()
  vim.cmd('Neogit')
end, {})
