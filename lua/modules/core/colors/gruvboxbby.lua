vim.g.gruvbox_baby_function_style = 'italic'
vim.g.gruvbox_baby_function_style = 'bold'
vim.g.gruvbox_baby_keyword_style = 'italic'
vim.g.gruvbox_baby_keyword_style = 'bold'
vim.g.gruvbox_baby_comment_style = 'italic'

-- Enable telescope theme
vim.g.gruvbox_baby_telescope_theme = 1

vim.cmd([[colorscheme gruvbox-baby]])

vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#242424', fg = '#242424' })
vim.api.nvim_set_hl(0, 'PMenuThumb', { bg = '#d65d0e' })
