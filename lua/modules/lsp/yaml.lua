local M = {}

M.setup = function(on_attach, capabilities)
  local lspconfig = require('lspconfig')

  lspconfig['yamlls'].setup({
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    settings = {
      yaml = {
        schemas = {
          ['https://gitlab.com/chromaway/core-tools/chromia-cli-tools/-/raw/dev/chromia-build-tools/src/main/resources/chromia-model-schema.json'] = 'chromia.yml',
        },
      },
    },
  })
end

return M
