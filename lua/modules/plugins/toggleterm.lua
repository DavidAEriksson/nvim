require('toggleterm').setup({
  start_in_insert = false,
})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
