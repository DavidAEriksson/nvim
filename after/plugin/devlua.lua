local ldev_ok, luadev = pcall(require, 'lua-dev')

if not ldev_ok then
  return
end

luadev.setup({})


local lsp_ok, lspconfig = pcall(require, 'lspconfig')

if not lsp_ok then
  return
end

lspconfig.sumneko_lua.setup(luadev)
