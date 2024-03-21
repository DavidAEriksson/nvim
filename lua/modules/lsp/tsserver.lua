local M = {}

M.setup = function(on_attach, capabilities)
  local lspconfig = require('lspconfig')

  lspconfig['tsserver'].setup({
    root_dir = lspconfig.util.root_pattern('package.json'),
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
