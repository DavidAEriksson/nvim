require('mason').setup({
  -- registries = {
  --   'file:~/Development/mason-registry',
  -- },
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
})
require('mason-lspconfig').setup()
