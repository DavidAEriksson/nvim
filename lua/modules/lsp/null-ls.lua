-- null-ls
local null_ls = require('null-ls')
local b = null_ls.builtins

local with_root_file = function(builtin, file)
  return builtin.with({
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  })
end

-- null-ls sources
local sources = {
  ---actions
  b.code_actions.gitsigns,
  b.code_actions.gitrebase,
  b.code_actions.eslint,
  b.code_actions.refactoring,
  b.code_actions.shellcheck,
  b.code_actions.ts_node_action,
  require('typescript.extensions.null-ls.code-actions'),

  ---formatting
  b.formatting.eslint_d,
  b.formatting.prettier.with({
    disabled_filetypes = { 'typescript', 'typescriptreact' },
  }),
  with_root_file(b.formatting.stylua, 'stylua.toml'),
  b.formatting.fixjson,
  b.formatting.rustfmt,
  b.formatting.goimports,

  ---diagnostics
  b.diagnostics.shellcheck.with({ diagnostics_format = '#{m} [#{c}]' }),
  b.diagnostics.tsc,
  b.diagnostics.gitlint,
  b.diagnostics.zsh,
  b.diagnostics.trail_space,
  b.diagnostics.eslint,
  b.diagnostics.eslint_d,
}

local M = {}

M.setup = function(on_attach, capabilities)
  require('null-ls').setup({
    sources = sources,
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
