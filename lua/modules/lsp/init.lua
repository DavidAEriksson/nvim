local u = require('utils')
local lsp = vim.lsp
local api = vim.api
local fn = vim.fn
local border_opts = { border = 'rounded', focusable = true, scope = 'line' }

-- diagnostics
vim.diagnostic.config({ virtual_text = true, float = border_opts })
fn.sign_define('DiagnosticSignError', { text = '✗', texthl = 'DiagnosticSignError' })
fn.sign_define('DiagnosticSignWarn', { text = '!', texthl = 'DiagnosticSignWarn' })
fn.sign_define('DiagnosticSignInformation', { text = '', texthl = 'DiagnosticSignInfo' })
fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

-- handlers
lsp.handlers['textDocument/signatureHelp'] = lsp.with(lsp.handlers.signature_help, border_opts)
lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hover, border_opts)

-- use lsp formatting if it's available (and if it's good)
-- otherwise, fall back to null-ls
local preferred_formatting_clients = { 'eslint' }
local fallback_formatting_client = 'null-ls'

vim.api.nvim_create_user_command('LspLog', [[exe 'tabnew ' .. luaeval("vim.lsp.get_log_path()")]], {})

local formatting = function(bufnr)
  bufnr = tonumber(bufnr) or api.nvim_get_current_buf()

  local selected_client
  for _, client in ipairs(lsp.buf_get_clients(bufnr)) do
    if vim.tbl_contains(preferred_formatting_clients, client.name) then
      selected_client = client
      break
    end

    if client.name == fallback_formatting_client then
      selected_client = client
    end
  end

  if not selected_client then
    return
  end

  local params = lsp.util.make_formatting_params()

  selected_client.request('textDocument/formatting', params, function(err, res)
    if err then
      local err_msg = type(err) == 'string' and err or err.message
      vim.notify('global.lsp.formatting: ' .. err_msg, vim.log.levels.WARN)
      return
    end

    if not api.nvim_buf_is_loaded(bufnr) or api.nvim_buf_get_option(bufnr, 'modified') then
      return
    end

    if res then
      lsp.util.apply_text_edits(res, bufnr, selected_client.offset_encoding or 'utf-16')
      api.nvim_buf_call(bufnr, function()
        vim.cmd('silent noautocmd update')
      end)
    end
  end, bufnr)
end

global.lsp = {
  border_opts = border_opts,
  formatting = formatting,
}

local on_attach = function(client, bufnr)
  require('lsp_signature').on_attach()

  -- commands
  u.command('LspFormatting', vim.lsp.buf.formatting)
  u.command('LspHover', vim.lsp.buf.hover)
  u.command('LspDiagPrev', vim.diagnostic.goto_prev)
  u.command('LspDiagNext', vim.diagnostic.goto_next)
  u.command('LspDiagLine', vim.diagnostic.open_float)
  u.command('LspDiagQuickfix', vim.diagnostic.setqflist)
  u.command('LspSignatureHelp', vim.lsp.buf.signature_help)
  u.command('LspTypeDef', vim.lsp.buf.type_definition)
  u.command('LspDef', vim.lsp.buf.definition)
  u.command('LspRangeAct', vim.lsp.buf.range_code_action)

  u.command('LspRename', function()
    vim.lsp.buf.rename()
  end)

  --- LSP Mappings
  u.buf_map(bufnr, 'n', '<leader>rn', ':LspRename<CR>')
  u.buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
  u.buf_map(bufnr, 'n', 'K', ':LspHover<CR>')
  u.buf_map(bufnr, 'n', '<C-p>', ':LspDiagPrev<CR>')
  u.buf_map(bufnr, 'n', '<C-n>', ':LspDiagNext<CR>')
  u.buf_map(bufnr, 'n', 'gf', ':LspDiagLine<CR>')
  u.buf_map(bufnr, 'n', '<leader>q', ':LspDiagQuickfix<CR>')
  u.buf_map(bufnr, 'n', '<C-k>', ':LspSignatureHelp<CR>')

  --- Telescope LSP mappings
  u.buf_map(bufnr, 'n', '<leader>gr', ':Telescope lsp_references<CR>')
  u.buf_map(bufnr, 'n', '<leader>td', ':Telescope lsp_type_definitions<CR>')
  u.buf_map(bufnr, 'n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')

  if client.resolved_capabilities.signature_help then
    vim.cmd('autocmd CursorHoldI <buffer> lua vim.lsp.buf.signature_help()')
  end

  if client.supports_method('textDocument/formatting') then
    local lsp_format_buf = function()
      global.lsp.formatting(vim.fn.expand('<abuf>'))
    end

    vim.api.nvim_create_augroup('LspFormatting', { clear = false })

    vim.api.nvim_create_autocmd({ 'BufWritePost <buffer>' }, {
      desc = 'Trigger LSP Autoformat on save',
      callback = lsp_format_buf,
      group = 'LspFormatting',
    })
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Setup language servers from server name
for _, server in ipairs({
  'tsserver',
  'sumneko_lua',
  'csharp_ls',
  'go'
  -- 'null-ls', TODO: re-enable null-ls when it's fixed
}) do
  require('modules.lsp.' .. server).setup(on_attach, capabilities)
end

-- suppress lspconfig messages
local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match('%[lspconfig%]') then
    return
  end

  notify(msg, ...)
end

require('nvim-lsp-installer').setup({
  ensure_installed = { 'csharp_ls' }, -- ensure these servers are always installed
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = '✓',
      server_pending = '➜',
      server_uninstalled = '✗',
    },
  },
})
