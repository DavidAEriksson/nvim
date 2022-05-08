require('ayu').setup({
  mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
})

vim.cmd('colorscheme ayu')
-- Default options
-- require('nightfox').setup({
--   options = {
--     terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
--     dim_inactive = false, -- Non focused panes set to alternative background
--     styles = { -- Style to be applied to different syntax groups
--       comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
--       conditionals = 'italic',
--       constants = 'bold',
--       functions = 'italic',
--       keywords = 'NONE',
--       numbers = 'bold',
--       operators = 'NONE',
--       strings = 'italic',
--       types = 'italic',
--       variables = 'NONE',
--     },
--     inverse = { -- Inverse highlight for different types
--       match_paren = false,
--       visual = false,
--       search = false,
--     },
--   },
-- })
--
-- vim.cmd('colorscheme nightfox')
