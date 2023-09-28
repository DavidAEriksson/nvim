local ok, bufferline = pcall(require, 'bufferline')

if not ok then
  return
end

bufferline.setup({
  options = {
    mode = 'buffers',
    style_preset = bufferline.style_preset.default,
    themable = true,
    numbers = 'ordinal',
    close_command = 'bdelete! %d',
    right_mouse_command = 'bdelete! %d',
    left_mouse_command = 'buffer %d',
    middle_mouse_command = nil,
    indicator = {
      icon = '▎',
      style = 'icon',
    },
    buffer_close_icon = '󰅖',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(buf)
      ---@diagnostic disable-next-line: undefined-field
      return buf.name
    end,
    max_name_length = 18,
    max_prefix_length = 15,
    truncate_names = true,
    tab_size = 10,
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = false,
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = ' '
      for e, n in pairs(diagnostics_dict) do
        local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or ' ')
        s = s .. n .. sym
      end
      return s
    end,
    custom_filter = function()
      return true
    end,
    offsets = {
      {
        filetype = 'neo-tree',
        text_align = 'left',
        separator = true,
      },
    },
    color_icons = true,
    get_element_icon = function(element)
      local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
      return icon, hl
    end,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    show_duplicate_prefix = true,
    persist_buffer_sort = false,
    move_wraps_at_ends = false,
    separator_style = 'thin',
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' },
    },
    sort_by = 'insert_at_end',
    view = '',
    debug = {
      logging = false,
    },
    groups = {
      items = {},
      options = {
        toggle_hidden_on_enter = false,
      },
    },
    show_buffer_default_icon = true,
  },
  highlights = {},
})
