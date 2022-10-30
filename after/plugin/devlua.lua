local ldev_ok, neodev = pcall(require, 'neodev')

if not ldev_ok then
  return
end

neodev.setup({})

local lsp_ok, lspconfig = pcall(require, 'lspconfig')

if not lsp_ok then
  return
end

lspconfig.sumneko_lua.setup(neodev)
