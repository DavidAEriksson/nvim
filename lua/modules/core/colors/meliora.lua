--[[ local ok, meliora = pcall(require, 'meliora') ]]
--[[]]
--[[ if not ok then ]]
--[[   return ]]
--[[ end ]]

require('meliora').setup({
  dim_inactive = false,
  color_set = 'mellifluous',
  styles = {
    comments = 'italic',
    conditionals = 'NONE',
    folds = 'italic',
    loops = 'NONE',
    functions = 'italic',
    keywords = 'italic',
    strings = 'NONE',
    variables = 'NONE',
    numbers = 'NONE',
    booleans = 'bold',
    properties = 'NONE',
    types = 'italic',
    operators = 'NONE',
  },
  transparent_background = {
    enabled = false,
    floating_windows = false,
    telescope = true,
    file_tree = true,
    cursor_line = true,
    status_line = false,
  },
  plugins = {
    cmp = true,
    indent_blankline = true,
    nvim_tree = {
      enabled = true,
      show_root = false,
    },
    telescope = {
      enabled = true,
      nvchad_like = true,
    },
    startify = true,
  },
})

vim.cmd([[colorscheme meliora]])
