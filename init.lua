local ok, _ = pcall(require, 'impatient')

if not ok then
  print('❌ Source modules.plugins.packer, call :PackerInstall and restart. ❌')
  _G.packer_installed = false
else
  _G.packer_installed = true
end

---@string 'dark'|'light'|'kanagawa'
_G.theme = 'kanagawa'

require('modules.core')
require('modules.lsp')
require('modules.plugins')
