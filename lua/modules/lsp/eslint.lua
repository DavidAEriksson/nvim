local M = {}

M.setup = function(on_attach, capabilities)
  local lspconfig = require('lspconfig')

  lspconfig['eslint'].setup({
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    bin = 'eslint', -- or `eslint_d`
    code_actions = {
      enable = true,
      apply_on_save = {
        enable = true,
        types = { 'directive', 'problem', 'suggestion', 'layout' },
      },
      disable_rule_comment = {
        enable = true,
        location = 'separate_line', -- or `same_line`
      },
    },
    diagnostics = {
      enable = true,
      report_unused_disable_directives = false,
      run_on = 'type', -- or `save`
    },
  })
end

return M
