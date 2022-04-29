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

-- Escape? More like shut the hell up
imap('jk', '<Esc>')
imap('kj', '<Esc>')

-- Tab to next S-Tab to prev buf
nmap('<TAB>', ':bnext<CR>')
nmap('<S-TAB>', ':bprevious<CR>')
nmap('<leader>bd', ':bd<CR>')

-- Visual mode tabbing
vmap('<', '<gv')
vmap('>', '>gv')

-- Window navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- Save all open buffers
nmap('<Leader>ww', '<cmd>bufdo w<CR>')

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
nmap('<S-f>', ': Telescope find_files<CR>')
nmap('<leader>rg', ':Telescope live_grep<CR>')
nmap('<leader>fb', ':Telescope buffers<CR>')
nmap('<leader>fh', ':Telescope help_tags<CR>')
nmap('<leader>wt', ':lua require("telescope").extensions.git_worktree.git_worktrees()<CR>')
nmap('<leader>cw', ':lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>')

-- NvimTree
nmap('<leader>e', ':NvimTreeToggle<CR>')

-- Floating terminal
nmap('<leader>ter', '<cmd>:FloatermNew<CR>')

-- Harpoon
nmap('<leader>ha', "<cmd> lua require('harpoon.mark').add_file()<CR>")
nmap('<leader>hm', "<cmd> lua require('harpoon.ui').toggle_quick_menu()<CR>")
nmap('<leader>h1', "<cmd> lua require('harpoon.ui').nav_file(1)<CR>")
nmap('<leader>h2', "<cmd> lua require('harpoon.ui').nav_file(2)<CR>")
nmap('<leader>h3', "<cmd> lua require('harpoon.ui').nav_file(3)<CR>")
nmap('<leader>h4', "<cmd> lua require('harpoon.ui').nav_file(4)<CR>")

vim.cmd([[
  imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
]])

--DAP

nmap('<leader>dct', '<cmd>lua require"dap".continue()<CR>')
nmap('<leader>dsv', '<cmd>lua require"dap".step_over()<CR>')
nmap('<leader>dsi', '<cmd>lua require"dap".step_into()<CR>')
nmap('<leader>dso', '<cmd>lua require"dap".step_out()<CR>')
nmap('<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>')

-- DAP Telescope

-- telescope-dap
nmap('<leader>dcc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
nmap('<leader>dco', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
nmap('<leader>dlb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
nmap('<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
nmap('<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')
