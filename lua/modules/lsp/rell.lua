local M = {}

M.setup = function(on_attach, capabilities)
  local lspconfig = require('lspconfig')

  lspconfig['rell'].setup({
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    before_init = function(init_params, config)
      init_params.initializationOptions = {
        indexCaching = true,
      }
    end,
  })
end

return M
