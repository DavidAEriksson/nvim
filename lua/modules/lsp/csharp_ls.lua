local M = {}

M.setup = function(on_attach, capabilities)
  local lspconfig = require('lspconfig')
  lspconfig['csharp_ls'].setup({
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
  })
end

return M
