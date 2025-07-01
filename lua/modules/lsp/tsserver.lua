local M = {}

M.setup = function(on_attach, capabilities)
  local lspconfig = require('lspconfig')

  lspconfig['ts_ls'].setup({
    root_dir = lspconfig.util.root_pattern('package.json'),
    on_attach = on_attach,
    capabilities = capabilities,
    single_file_support = false,
  })
end

return M
