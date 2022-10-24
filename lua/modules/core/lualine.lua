-- statusline

-- https://github.com/nvim-lualine/lualine.nvim
-- https://github.com/arkav/lualine-lsp-progress
local config = {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = {
      {
        require("noice").api.statusline.message.get_hl,
        cond = require("noice").api.statusline.message.has,
      },
      {
        require("noice").api.statusline.command.get,
        cond = require("noice").api.statusline.command.has,
        color = { fg = "#ff9e64" },
      },
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      },
      {
        require("noice").api.statusline.search.get,
        cond = require("noice").api.statusline.search.has,
        color = { fg = "#ff9e64" },
      },
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
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
