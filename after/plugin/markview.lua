local ok, markview = pcall(require, 'markview')
local presets = require('markview.presets')

if not ok then
  return
end

markview.setup({
  headings = presets.headings.glow_labels,
})

vim.cmd('Markview enable')
