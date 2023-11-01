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

vim.g.editorconfig = false

-- File encodings --
vim.o.encoding = 'UTF-8'
vim.o.fileencoding = 'UTF-8'
vim.o.timeoutlen = 500
vim.o.updatetime = 25
vim.o.ttimeoutlen = 0
vim.o.list = true
vim.o.listchars = 'eol:↲,tab:> ,trail:-,nbsp:+'

-- Sidebar and numbers --
vim.o.number = true
vim.o.numberwidth = 3
vim.o.signcolumn = 'yes'
vim.o.modelines = 0
vim.o.showcmd = true
vim.o.relativenumber = true
-- Tabs and whitespace --
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.cmd([[
	set nowrap
]])

-- Windows --
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showtabline = 2

-- Cursor --
vim.o.ruler = true
vim.o.cursorline = false
vim.o.scrolloff = 5
vim.o.clipboard = 'unnamedplus'

-- Search --
vim.cmd([[set nohlsearch]])
vim.g.incsearch = true

-- Always show statusline
vim.o.laststatus = 1

-- Colors
vim.o.termguicolors = true
vim.o.colorcolumn = ''

-- Folds
vim.o.foldmethod = 'manual'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- Hide statusline by setting laststatus and cmdheight to 0.
--[[ vim.vim.o.ls = 0 ]]
--[[ vim.vim.o.ch = 0 ]]

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
