local u = require('utils')

local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

--[[
  `nmap`
  Map keys to normal mode.

  @param {string} shortcut - The key combination to map.
  @param {string} command - The command to execute.
]]
local function nmap(shortcut, command)
  map('n', shortcut, command)
end

--[[
  `imap`
  Map keys to insert mode.

  @param {string} shortcut - The key combination to map.
  @param {string} command - The command to execute.
]]
local function imap(shortcut, command)
  map('i', shortcut, command)
end

--[[
  `vmap`
  Map keys to visual mode.

  @param {string} shortcut - The key combination to map.
  @param {string} command - The command to execute.
]]
local function vmap(shortcut, command)
  map('v', shortcut, command)
end

-- Escape? More like shut the hell up
imap('jk', '<Esc>')
imap('kj', '<Esc>')

-- Tab to next S-Tab to prev buf
nmap('<TAB>', '<Plug>(cokeline-focus-next)')
nmap('<S-TAB>', '<Plug>(cokeline-focus-prev)')
nmap('<leader>bd', ':lua require("bufdelete").bufdelete(0, true) <CR>')

-- Allow S-TAB to dedent in insert mode
imap('<S-TAB>', '<C-D>')

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
nmap('<C-d>', '<C-d>zz')
nmap('<C-u>', '<C-u>zz')

-- Move all the text (:
vmap('J', ":m '>+1<CR>gv=gv")
vmap('K', ":m '<-2<CR>gv=gv")
nmap('<leader>j', '<esc>:m .+1<CR>==')
nmap('<leader>k', '<esc>:m .-2<CR>==')

-- Move view horizontally
nmap('zh', '100zh')
nmap('zl', '100zl')

-- Telescope
nmap('<leader>ff', ':Telescope find_files<CR>')
nmap('<leader>rg', ':Telescope live_grep<CR>')
nmap('<leader>fb', ':Telescope buffers<CR>')
nmap('<leader>fh', ':Telescope help_tags<CR>')
nmap('<leader>wt', ':lua require("telescope").extensions.git_worktree.git_worktrees()<CR>')
nmap('<leader>cw', ':lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>')

-- NeoTree
nmap('<leader>e', '<cmd>:NeoTreeFocusToggle<CR>')

-- Floating terminal
nmap('<leader>ter', '<cmd>:ToggleTerm<CR>')
nmap('<leader>tel', '<cmd>:ToggleTerm direction=vertical<CR>')

-- Hop!
nmap('<leader>h', '<cmd>:HopWord<CR>')
nmap('<leader>hl', '<cmd>:HopLine<CR>')

-- Fugitive
nmap('<leader>g', '<cmd>:Git<CR>')

-- Trouble
nmap('<leader>tt', '<cmd>:TroubleToggle<CR>')
nmap('<leader>tw', '<cmd>:TroubleToggle workspace_diagnostics<CR>')
nmap('<leader>td', '<cmd>:TroubleToggle document_diagnostics<CR>')

-- Zippy
nmap('<leader>l', "<cmd>: lua require('zippy').insert_print()<CR>")

nmap('<leader>u', '<cmd>: UndotreeToggle<CR>')

nmap('<leader>n', "<cmd>: :lua require('neogen').generate()<CR>")

nmap('<leader>g', '<cmd>:Neogit<CR>')

-- Copilot accept insert
vim.keymap.set(
  'i',
  '<C-J>',
  "copilot#Accept('<CR>')",
  { noremap = true, silent = true, expr = true, replace_keycodes = false }
)

-- Autoclose tags
vim.keymap.set('i', '/', function()
  local ts_utils = require('nvim-treesitter.ts_utils')

  local node = ts_utils.get_node_at_cursor()
  if not node then
    return '/'
  end

  if node:type() == 'jsx_opening_element' then
    local char_at_cursor = vim.fn.strcharpart(vim.fn.strpart(vim.fn.getline('.'), vim.fn.col('.') - 2), 0, 1)
    local already_have_space = char_at_cursor == ' '

    return already_have_space and '/>' or ' />'
  end

  return '/'
end, {
  expr = true,
  buffer = true,
})

vim.keymap.set({ 'n', 'x' }, '<leader>sa', function()
  require('scissors').addNewSnippet()
end)

vim.keymap.set('n', '<leader>se', function()
  require('scissors').editSnippet()
end)
