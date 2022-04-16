local cmd = vim.cmd
local g = vim.g

g.indent_blankline_char = '▏'

g.indent_blankline_use_treesitter = true
g.indent_blankline_show_current_context = true

g.indent_blankline_show_first_indent_level = true
g.indent_blankline_show_trailing_blankline_indent = true

g.indent_blankline_context_patterns = {
  'class',
  'function',
  'method',
  '^if',
  '^while',
  '^for',
  '^object',
  '^table',
  'block',
  'arguments',
}

g.indent_blankline_filetype_exclude = { 'help', 'packer', 'terminal' }
g.indent_blankline_buftype_exclude = { 'help', 'terminal', 'nofile' }
g.indent_blankline_char_highlight = 'LineNr'
g.indent_blankline_max_indent_increase = 1
