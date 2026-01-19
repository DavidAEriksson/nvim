vim.g.mapleader = ' '

vim.cmd([[
  set path+=*
  set shell=/bin/zsh
  set wildignore+=**./.git/
  set wildignore+=**/node_modules
]])

vim.g.editorconfig = false

vim.o.encoding = 'UTF-8'
vim.o.fileencoding = 'UTF-8'
vim.o.timeoutlen = 500
vim.o.updatetime = 25
vim.o.ttimeoutlen = 0
vim.o.list = true
vim.o.listchars = 'eol:↲,tab:> ,trail:-,nbsp:+'

vim.o.number = true
vim.o.numberwidth = 3
vim.o.signcolumn = 'yes'
vim.o.modelines = 0
vim.o.showcmd = true
vim.o.relativenumber = true

vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.cmd([[set nowrap]])

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showtabline = 2

vim.o.ruler = true
vim.o.cursorline = false
vim.o.scrolloff = 5
vim.o.clipboard = 'unnamedplus'

vim.cmd([[set nohlsearch]])
vim.g.incsearch = true

vim.cmd([[set laststatus=3]])

vim.o.termguicolors = true
vim.o.colorcolumn = ''

vim.o.foldmethod = 'manual'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

vim.cmd([[
  let g:prettier#autoformat = 1
  let g:prettier#autoformat_require_pragma = 0
]])

vim.g.root_spec = { 'cwd' }

vim.cmd('set completeopt+=noselect')
