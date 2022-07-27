local M = {}

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
  ---formatting
  with_root_file(b.formatting.stylua, 'stylua.toml'),
  b.formatting.trim_whitespace,
  b.formatting.fixjson,
  b.formatting.prettier
}

M.setup = function(on_attach, capabilities)
  require('null-ls').setup({
    sources = sources,
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
