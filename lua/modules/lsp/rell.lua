local M = {}

M.setup = function(on_attach, capabilities)
  vim.lsp.start({
    -- name = 'rell',
    cmd = { '~/.vscode/extensions/chromaway.rell-language-extension-0.2.10-darwin-arm64/server/rell-lsp.sh' },
    root_dir = vim.fn.getcwd(),
  })
end

return M
