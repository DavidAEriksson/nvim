---@diagnostic disable: param-type-mismatch

require('nvim-dap-virtual-text').setup({
  commented = true,
})

local ok_dap, dap = pcall(require, 'dap')

if not ok_dap then
  return
end

local ok_dapui, dapui = pcall(require, 'dapui')

if not ok_dapui then
  return
end

local ok_key, whichkey = pcall(require, 'which-key')
if not ok_key then
  return
end

dap.adapters.netcoredbg = {
  type = 'executable',
  command = os.getenv('HOME') .. '/Downloads/netcoredbg/netcoredbg',
  args = { '--interpreter=vscode' },
}
dap.configurations.cs = {
  {
    type = 'netcoredbg',
    name = 'launch - netcoredbg',
    request = 'launch',
    program = function()
      ---@diagnostic disable-next-line: redundant-parameter
      return vim.fn.input('Path to dll', vim.fn.getcwd(), 'file')
    end,
  },
  {
    type = 'netcoredbg',
    name = 'attach - netcoredbg',
    request = 'attach',
    processId = require('dap.utils').pick_process,
  },
}

dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = { 'dap', '-l', '127.0.0.1:${port}' },
  },
}

dap.configurations.go = {
  {
    type = 'delve',
    name = 'Debug',
    request = 'launch',
    program = '${file}',
  },
  {
    type = 'delve',
    name = 'Debug test', -- configuration for debugging test files
    request = 'launch',
    mode = 'test',
    program = '${file}',
  },
  -- works with go.mod packages and sub packages
  {
    type = 'delve',
    name = 'Debug test (go.mod)',
    request = 'launch',
    mode = 'test',
    program = './${relativeFileDirname}',
  },
}

dapui.setup({})

vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = 'LspDiagnosticsSignError', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'LspDiagnosticsSignHint', linehl = '', numhl = '' })
vim.fn.sign_define(
  'DapBreakpointRejected',
  { text = '⭐️', texthl = 'LspDiagnosticsSignInformation', linehl = '', numhl = '' }
)

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

local keymap = {
  d = {
    name = 'Debug',
    R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", 'Run to Cursor' },
    E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", 'Evaluate Input' },
    C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", 'Conditional Breakpoint' },
    U = { "<cmd>lua require'dapui'.toggle()<cr>", 'Toggle UI' },
    b = { "<cmd>lua require'dap'.step_back()<cr>", 'Step Back' },
    c = { "<cmd>lua require'dap'.continue()<cr>", 'Continue' },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", 'Disconnect' },
    e = { "<cmd>lua require'dapui'.eval()<cr>", 'Evaluate' },
    g = { "<cmd>lua require'dap'.session()<cr>", 'Get Session' },
    h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", 'Hover Variables' },
    S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", 'Scopes' },
    i = { "<cmd>lua require'dap'.step_into()<cr>", 'Step Into' },
    o = { "<cmd>lua require'dap'.step_over()<cr>", 'Step Over' },
    p = { "<cmd>lua require'dap'.pause.toggle()<cr>", 'Pause' },
    q = { "<cmd>lua require'dap'.close()<cr>", 'Quit' },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", 'Toggle Repl' },
    s = { "<cmd>lua require'dap'.continue()<cr>", 'Start' },
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", 'Toggle Breakpoint' },
    x = { "<cmd>lua require'dap'.terminate()<cr>", 'Terminate' },
    u = { "<cmd>lua require'dap'.step_out()<cr>", 'Step Out' },
  },
}

whichkey.register(keymap, {
  mode = 'n',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})

local keymap_v = {
  name = 'Debug',
  e = { "<cmd>lua require'dapui'.eval()<cr>", 'Evaluate' },
}
whichkey.register(keymap_v, {
  mode = 'v',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})
