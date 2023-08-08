local ok, chunk = pcall(require, 'hlchunk')

if not ok then
  return
end

chunk.setup({
  chunk = {
    enable = true,
    use_treesitter = true,
    notify = true, -- notify if some situation(like disable chunk mod double time)
    exclude_filetypes = {
      aerial = true,
      dashboard = true,
    },
    support_filetypes = {
      '*.lua',
      '*.js',
      '*.jsx',
      '*.ts',
      '*.tsx',
      '*.rs',
      '*.cs',
      '*.sol',
    },
    chars = {
      horizontal_line = '─',
      vertical_line = '│',
      left_top = '╭',
      left_bottom = '╰',
      right_arrow = '>',
    },
    style = {
      { fg = '#C895BF' },
    },
  },

  indent = {
    enable = true,
    use_treesitter = false,
    chars = {
      '│',
    },
    style = {
      { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('Whitespace')), 'fg', 'gui') },
    },
  },

  line_num = {
    enable = true,
    use_treesitter = false,
    style = '#C895BF',
  },

  blank = {
    enable = true,
    chars = {
      '․',
    },
    style = {
      vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('Whitespace')), 'fg', 'gui'),
    },
  },
})
