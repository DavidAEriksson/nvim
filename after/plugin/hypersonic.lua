local ok, hypersonic = pcall(require, 'hypersonic')

if not ok then
  return
end

hypersonic.setup({
  ---@type 'none'|'single'|'double'|'rounded'|'solid'|'shadow'|table
  border = 'solid',
  ---@type number 0-100
  winblend = 0,
  ---@type boolean
  add_padding = true,
  ---@type string
  hl_group = 'Keyword',
  ---@type string
  wrapping = '"',
  ---@type boolean
  enable_cmdline = true,
})
