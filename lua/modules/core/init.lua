require('modules.core.settings')
require('modules.core.mappings')
if _G.theme == 'dark' then
  require('modules.core.colors.nordic')
end
if _G.theme == 'light' then
  require('modules.core.colors.github')
end
require('modules.core.lualine')
require('modules.core.scratch')
require('modules.core.snip')
require('modules.core.mason')
require('modules.core.autocmd')
require('modules.core.usercmd')
