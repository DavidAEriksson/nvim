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
    separator_style = 'slant',
    show_close_icon = false,
    themable = true,
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Directory',
        separator = true,
      },
    },
    show_buffer_close_icons = false,
    sort_by = 'insert_at_end',
  },
})
