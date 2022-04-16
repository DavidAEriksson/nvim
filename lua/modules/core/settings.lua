local o = vim.opt

vim.g.mapleader = ' '

-- Path defaults --
vim.cmd([[
		set path+=*
		set shell=/bin/zsh
		set wildignore+=**./.git/
		set wildignore+=**/node_modules
  ]])

-- File encodings --
o.encoding = 'UTF-8'
o.fileencoding = 'UTF-8'

-- Sidebar and numbers --
o.number = true
o.numberwidth = 3
o.signcolumn = 'yes'
o.modelines = 0
o.showcmd = true
o.relativenumber = true

-- Tabs and whitespace --
o.tabstop = 2
o.expandtab = true
o.shiftwidth = 2
o.autoindent = true
o.smartindent = true
o.smarttab = true
vim.g.nowrap = true

-- Windows --
o.splitbelow = true
o.splitright = true
o.showtabline = 1

-- Cursor --
o.ruler = true
o.cursorline = true
o.scrolloff = 5

-- Search --
vim.cmd([[set nohlsearch]])
vim.g.incsearch = true

-- Always show statusline
o.laststatus = 1

-- Colors
o.termguicolors = true
o.colorcolumn = '120'
o.background = 'dark'

-- Laststatus
o.laststatus = 3
-- If we're running a coloscheme that does not yet
-- support >0.7 global status line.
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  command = ':highlight WinSeparator guibg=none',
})
