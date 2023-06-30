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

-- FIX: This ugly ass telescope theme

vim.cmd('colorscheme github_light')
