local o = vim.opt

vim.g.mapleader = ' '

-- Startup augroup
local buf_en = vim.api.nvim_create_augroup('Startup', { clear = true })

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
vim.cmd([[
	set nowrap
]])

-- Windows --
o.splitbelow = true
o.splitright = true
o.showtabline = 1

-- Cursor --
o.ruler = true
o.cursorline = true
o.scrolloff = 5
o.clipboard = 'unnamedplus'

-- Search --
vim.cmd([[set nohlsearch]])
vim.g.incsearch = true

-- Always show statusline
o.laststatus = 1

-- Colors
o.termguicolors = true
o.colorcolumn = '120'
o.background = 'dark'

-- Folds
-- o.foldmethod = "expr"
-- o.foldexpr = "nvim_treesitter#foldexpr()"
--
-- vim.api.nvim_create_autocmd({ 'BufEnter' }, {
--   pattern = '*',
--   command = 'normal zR',
--   group = buf_en,
-- })

-- Stop newline comment continuation
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = '*',
  command = 'set formatoptions-=cro',
  group = buf_en,
})
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  command = 'setlocal formatoptions-=cro',
  group = buf_en,
  pattern = '*',
})

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  command = 'set laststatus=3',
  group = buf_en,
  pattern = '*',
})

-- Highlight yanked area for 300 ms
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  command = 'silent! lua vim.highlight.on_yank({higroup="Visual", timeout=300})',
})

-- Disable statusline in alpha
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = 'alpha',
  callback = function()
    vim.cmd('set laststatus=0')
  end,
})

-- Set global statusline
vim.api.nvim_create_autocmd({ 'BufUnload' }, {
  buffer = 0,
  callback = function()
    vim.cmd('set laststatus=3')
  end,
})

vim.cmd([[
	let g:prettier#autoformat = 1
	let g:prettier#autoformat_require_pragma = 0
]])
