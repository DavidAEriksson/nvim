local ok, color_picker = pcall(require, 'color-picker')
if not ok then
  return
end

color_picker.setup({ -- for changing icons & mappings
  ['icons'] = { 'ﱢ', '' },
  ['border'] = 'solid', -- none | single | double | rounded | solid | shadow
  ['keymap'] = { -- mapping example:
    ['U'] = '<Plug>ColorPickerSlider5Decrease',
    ['O'] = '<Plug>ColorPickerSlider5Increase',
  },
  ['background_highlight_group'] = 'FloatBorder', -- default
  ['border_highlight_group'] = 'FloatBorder', -- default
  ['text_highlight_group'] = 'Variable', --default
})
