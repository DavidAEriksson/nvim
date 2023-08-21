local M = {}

M.setup = function(on_attach, capabilities)
  vim.lsp.start({
    name = 'rell',
    cmd = { 'rellsp' },
    root_dir = vim.fn.getcwd(),
  })
end

return M
