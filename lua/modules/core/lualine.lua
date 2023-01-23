-- statusline

-- https://github.com/nvim-lualine/lualine.nvim
-- https://github.com/arkav/lualine-lsp-progress
local config = {
  options = {
    icons_enabled = true,
    theme = 'nordic',
    component_separators = '|',
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '', right = '' }, left_padding = 20 },
    },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = {
      { 'location', separator = { left = '', right = '' }, right_padding = 20 },
    },
  },
  extensions = {
    'quickfix',
    'nvim-tree',
  },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

ins_left({
  'lsp_progress',
  display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
  separators = {
    component = ' ',
    progress = ' | ',
    message = { pre = '(', post = ')', commenced = 'In Progress', completed = 'Completed' },
    percentage = { pre = '', post = '%% ' },
    title = { pre = '', post = ': ' },
    lsp_client_name = { pre = '[', post = ']' },
    spinner = { pre = '', post = '' },
  },
  timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
  spinner_symbols = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
})

require('lualine').setup(config)
