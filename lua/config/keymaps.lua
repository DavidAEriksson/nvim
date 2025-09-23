local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

imap('jk', '<Esc>')
imap('kj', '<Esc>')

nmap('<TAB>', '<Plug>(cokeline-focus-next)')
nmap('<S-TAB>', '<Plug>(cokeline-focus-prev)')
nmap('<leader>bd', ':lua require("bufdelete").bufdelete(0, true) <CR>')

imap('<S-TAB>', '<C-D>')

vmap('<', '<gv')
vmap('>', '>gv')

nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

nmap('<Leader>ww', '<cmd>:wa<CR>')

nmap('Y', 'y$')

nmap('<leader>yf', 'y<S-V>a<S-B><CR>')

nmap('n', 'nzzzv')
nmap('N', 'nzzzv')
nmap('J', 'mzJ`z')
nmap('<C-d>', '<C-d>zz')
nmap('<C-u>', '<C-u>zz')

vmap('J', ":m '>+1<CR>gv=gv")
vmap('K', ":m '<-2<CR>gv=gv")
nmap('<leader>j', '<esc>:m .+1<CR>==')
nmap('<leader>k', '<esc>:m .-2<CR>==')

nmap('zh', '100zh')
nmap('zl', '100zl')

nmap('<leader>ff', ':Telescope find_files<CR>')
nmap('<leader>rg', ':Telescope live_grep<CR>')
nmap('<leader>fb', ':Telescope buffers<CR>')
nmap('<leader>fh', ':Telescope help_tags<CR>')

nmap('<leader>e', '<cmd>:Neotree toggle<CR>')

nmap('<leader>ter', '<cmd>:ToggleTerm<CR>')
nmap('<leader>tel', '<cmd>:ToggleTerm direction=vertical<CR>')

nmap('<leader>tt', '<cmd>:TroubleToggle<CR>')
nmap('<leader>tw', '<cmd>:TroubleToggle workspace_diagnostics<CR>')
nmap('<leader>td', '<cmd>:TroubleToggle document_diagnostics<CR>')

nmap('<leader>l', "<cmd>: lua require('zippy').insert_print()<CR>")

nmap('<leader>u', '<cmd>: UndotreeToggle<CR>')

nmap('<leader>n', "<cmd>: :lua require('neogen').generate()<CR>")

nmap('<leader>g', '<cmd>:Neogit<CR>')

nmap('gf', '<cmd>:Lspsaga show_cursor_diagnostics<CR>')
nmap('<leader>q', '<cmd>:LspDiagQuickfix<CR>')
nmap('<C-k>', '<cmd>:LspSignatureHelp<CR>')
nmap('<leader>gi', '<cmd>:LspImplementation<CR>')
nmap('<leader>pd', '<cmd>:Lspsaga peek_type_definition<CR>')
nmap('<leader>rn', '<cmd>:Lspsaga rename<CR>')
nmap('<leader>K', '<cmd>:Lspsaga hover_doc<CR>')
nmap('<C-n>', '<cmd>:Lspsaga diagnostic_jump_next<CR>')
nmap('<C-p>', '<cmd>:Lspsaga diagnostic_jump_prev<CR>')
nmap('<leader>ca', '<cmd>:Lspsaga code_action<CR>')
nmap('gh', '<cmd>:Lspsaga finder<CR>')
nmap('<leader>o', '<cmd>:Lspsaga outline<CR>')
nmap('gd', '<cmd>:Lspsaga goto_definition<CR>')

vim.keymap.set(
  'i',
  '<C-J>',
  "copilot#Accept('<CR>')",
  { noremap = true, silent = true, expr = true, replace_keycodes = false }
)

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
