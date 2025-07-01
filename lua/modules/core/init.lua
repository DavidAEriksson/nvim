require('modules.core.settings')
require('modules.core.mappings')
if _G.theme == 'nordic' then
  require('modules.core.colors.nordic')
end
if _G.theme == 'gruvbox' then
  require('modules.core.colors.gruvboxbby')
end
if _G.theme == 'oxocarbon' then
  require('modules.core.colors.oxocarbon')
end
require('modules.core.lualine')
require('modules.core.scratch')
require('modules.core.snip')
require('modules.core.mason')
require('modules.core.autocmd')
