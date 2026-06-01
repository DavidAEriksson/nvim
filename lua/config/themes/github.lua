local ok, github = pcall(require, 'github-theme')

if not ok then
  return
end

github.setup({
  options = {
    styles = { -- Style to be applied to different syntax groups
      comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
      functions = 'italic',
      keywords = 'italic',
      variables = 'NONE',
      conditionals = 'NONE',
      constants = 'bold',
      numbers = 'NONE',
      operators = 'NONE',
      strings = 'italic',
      types = 'italic',
    },
  },
})

vim.cmd('colorscheme github_light')

vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { bg = '#d0d7de' })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = '#d0d7de' })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = '#218bff', fg = '#d0d7de' })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = '#d0d7de', fg = '#d0d7de' })

vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = '#eaeef2' })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = '#c297ff', fg = '#eaeef2' })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = '#eaeef2', fg = '#eaeef2' })

vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = '#f6f8fa' })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = '#cf222e', fg = '#f6f8fa' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = '#f6f8fa', fg = '#f6f8fa' })

vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#218bff', fg = '#afb8c1' })
