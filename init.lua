local ok, _ = pcall(require, 'impatient')

if not ok then
  print('❌ Source modules.plugins.packer, call :PackerInstall and restart. ❌')
  _G.packer_installed = false
else
  _G.packer_installed = true
end

_G.theme = 'dark'

require('modules.core')
require('modules.lsp')
require('modules.plugins')
