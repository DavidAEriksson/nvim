local ok, noice = pcall(require, 'noice')

if not ok then
  return
end

-- Extremely experimental, turned off for now
--[[ noice.setup({ ]]
--[[   views = { ]]
--[[     cmdline_popup = { ]]
--[[       border = { ]]
--[[         style = 'solid', ]]
--[[         padding = { 1, 1 }, ]]
--[[       }, ]]
--[[       filter_options = {}, ]]
--[[       win_options = { ]]
--[[         winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder', ]]
--[[       }, ]]
--[[     }, ]]
--[[   }, ]]
--[[ }) ]]
