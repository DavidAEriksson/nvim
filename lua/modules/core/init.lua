require('modules.core.settings')
require('modules.core.mappings')
if _G.theme == 'nordic' then
  require('modules.core.colors.nordic')
end
if _G.theme == 'gh-light' then
  require('modules.core.colors.github')
end
if _G.theme == 'kanagawa' then
  require('modules.core.colors.kanagawa')
end
if _G.theme == 'nightfox' then
  require('modules.core.colors.nightfox')
end
if _G.theme == 'chromia' then
  require('modules.core.colors.chromia')
end
if _G.theme == 'neofusion' then
  require('modules.core.colors.neofusion')
end
require('modules.core.lualine')
require('modules.core.scratch')
require('modules.core.snip')
require('modules.core.mason')
require('modules.core.autocmd')
require('modules.core.usercmd')
