local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

--[[
  `nmap`
  Map keys to normal mode.
]]
local function nmap(shortcut, command)
  map('n', shortcut, command)
end

--[[
  `imap`
  Map keys to insert mode.
]]
local function imap(shortcut, command)
  map('i', shortcut, command)
end

--[[
  `vmap`
  Map keys to visual mode.
]]
local function vmap(shortcut, command)
  map('v', shortcut, command)
end

-- Escape? More like shut the hell up
imap('jk', '<Esc>')
imap('kj', '<Esc>')

-- Tab to next S-Tab to prev buf
nmap('<TAB>', ':bnext<CR>')
nmap('<S-TAB>', ':bprevious<CR>')
nmap('<leader>bd', ':bd | bprevious <CR>')

-- Visual mode tabbing
vmap('<', '<gv')
vmap('>', '>gv')

-- Window navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- Save all open buffers
nmap('<Leader>ww', '<cmd>:wa<CR>')

-- Behave like the rest of us Y
nmap('Y', 'y$')

-- Yank function
nmap('<leader>yf', 'y<S-V>a<S-B><CR>')

-- Don't send me flying
nmap('n', 'nzzzv')
nmap('N', 'nzzzv')
nmap('J', 'mzJ`z')

-- Undo breakpoints
imap(',', ',<c-g>')
imap('.', '.<c-g>')
imap('!', '!<c-g>')
imap('?', '?<c-g>')
imap('(', '(<c-g>')
imap(')', ')<c-g>')
imap('[', '[<c-g>')
imap(']', ']<c-g>')
imap('{', '}<c-g>')
imap('}', '}<c-g>')

-- Move all the text (:
vmap('J', ":m '>+1<CR>gv=gv")
vmap('K', ":m '<-2<CR>gv=gv")
nmap('<leader>j', '<esc>:m .+1<CR>==')
nmap('<leader>k', '<esc>:m .-2<CR>==')

-- Telescope
nmap('<S-f>', ':Telescope find_files<CR>')
nmap('<leader>rg', ':Telescope live_grep<CR>')
nmap('<leader>fb', ':Telescope buffers<CR>')
nmap('<leader>fh', ':Telescope help_tags<CR>')
nmap('<leader>wt', ':lua require("telescope").extensions.git_worktree.git_worktrees()<CR>')
nmap('<leader>cw', ':lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>')

-- NvimTree
nmap('<leader>e', '<cmd>:NvimTreeToggle<CR>')
nmap('<leader>te', '<cmd>:NvimTreeResize +20<CR>')
nmap('<leader>ts', '<cmd>:NvimTreeResize -20<CR>')
nmap('<leader>c', '<cmd>:NvimTreeCollapse<CR>')

-- Floating terminal
nmap('<leader>ter', '<cmd>:FloatermNew<CR>')

-- Harpoon
nmap('<leader>ha', "<cmd> lua require('harpoon.mark').add_file()<CR>")
nmap('<leader>hm', "<cmd> lua require('harpoon.ui').toggle_quick_menu()<CR>")
nmap('<leader>h1', "<cmd> lua require('harpoon.ui').nav_file(1)<CR>")
nmap('<leader>h2', "<cmd> lua require('harpoon.ui').nav_file(2)<CR>")
nmap('<leader>h3', "<cmd> lua require('harpoon.ui').nav_file(3)<CR>")
nmap('<leader>h4', "<cmd> lua require('harpoon.ui').nav_file(4)<CR>")

-- Hop!
nmap('<leader>h', '<cmd>:HopWord<CR>')
nmap('<leader>hl', '<cmd>:HopLine<CR>')

vim.cmd([[
  imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
]])

-- Fugitive
nmap('<leader>g', '<cmd>:Git<CR>')

-- Trouble
nmap('<leader>tt', '<cmd>:TroubleToggle<CR>')
nmap('<leader>tw', '<cmd>:TroubleToggle workspace_diagnostics<CR>')
nmap('<leader>td', '<cmd>:TroubleToggle document_diagnostics<CR>')

vim.api.nvim_set_keymap(
  'v',
  '<leader>re',
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
  { noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
  'v',
  '<leader>rf',
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
  { noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
  'v',
  '<leader>rv',
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
  { noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
  'v',
  '<leader>ri',
  [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
  { noremap = true, silent = true, expr = false }
)
