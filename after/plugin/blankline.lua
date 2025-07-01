local ok, ibl = pcall(require, 'ibl')

if not ok then
  return
end

local context_char = '│'
local char = '┆'

ibl.setup({
  exclude = {
    filetypes = { 'neo-tree', 'startify', 'dashboard', 'help', 'markdown' },
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
    char = context_char,
  },
  indent = {
    char = char,
  },
})
