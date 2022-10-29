local ok, bufferline = pcall(require, 'bufferline')

if not ok then
  return
end

bufferline.setup({
  options = {
    numbers = 'ordinal',
    tab_size = 4,
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = true,
    separator_style = 'thin',
    show_close_icon = false,
    themable = true,
  },
})
