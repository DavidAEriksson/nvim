local u = require('utils')
local lsp = vim.lsp
local api = vim.api
local fn = vim.fn
local border_opts = { border = 'rounded', focusable = true, scope = 'line' }

require('neodev').setup({})

require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
    },
  },
})

-- diagnostics
vim.diagnostic.config({ virtual_text = true, float = border_opts })
fn.sign_define('DiagnosticSignError', { text = '✗', texthl = 'DiagnosticSignError' })
fn.sign_define('DiagnosticSignWarn', { text = '!', texthl = 'DiagnosticSignWarn' })
fn.sign_define('DiagnosticSignInformation', { text = '', texthl = 'DiagnosticSignInfo' })

-- handlers
lsp.handlers['textDocument/signatureHelp'] = lsp.with(lsp.handlers.signature_help, border_opts)
lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hover, border_opts)

-- use lsp formatting if it's available (and if it's good)

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local zero = require('lsp-zero').preset({})

zero.on_attach(function(client, bufnr)
  zero.default_keymaps({ buffer = bufnr })
end)

zero.setup()

local lsp_configurations = require('lspconfig.configs')

if not lsp_configurations.rell then
  lsp_configurations.rell = {
    default_config = {
      name = 'rell-lsp',
      cmd = {
        'rellsp',
      },
      filetypes = { 'rell' },
      root_dir = require('lspconfig.util').root_pattern('config.yml'),
    },
  }
end

local lsp_formatting = function(bufnr)
  local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
  lsp.buf.format({
    bufnr = bufnr,
    filter = function(client)
      if client.name == 'eslint' then
        return true
      end
    end,
  })
end

local on_attach = function(client, bufnr)
  api.nvim_buf_create_user_command(bufnr, 'LspDiagLine', vim.diagnostic.open_float, {})
  api.nvim_buf_create_user_command(bufnr, 'LspDiagQuickfix', vim.diagnostic.setqflist, {})
  api.nvim_buf_create_user_command(bufnr, 'LspSignatureHelp', vim.lsp.buf.signature_help, {})
  api.nvim_buf_create_user_command(bufnr, 'LspImplementation', vim.lsp.buf.implementation, {})

  --- LSP Mappings
  u.buf_map(bufnr, 'n', 'gf', ':LspDiagLine<CR>')
  u.buf_map(bufnr, 'n', '<leader>q', ':LspDiagQuickfix<CR>')
  u.buf_map(bufnr, 'n', '<C-k>', ':LspSignatureHelp<CR>')
  u.buf_map(bufnr, 'n', '<leader>gi', ':LspImplementation<CR>')

  --- LSP Saga Mappings
  u.buf_map(bufnr, 'n', '<leader>rn', ':Lspsaga rename<CR>')
  u.buf_map(bufnr, 'n', 'K', ':Lspsaga hover_doc<CR>')
  u.buf_map(bufnr, 'n', '<C-n>', ':Lspsaga diagnostic_jump_next<CR>')
  u.buf_map(bufnr, 'n', '<C-p>', ':Lspsaga diagnostic_jump_prev<CR>')
  u.buf_map(bufnr, 'n', '<leader>pd', ':Lspsaga peek_definition<CR>')
  u.buf_map(bufnr, 'n', 'gd', ':Lspsaga goto_definition<CR>')
  u.buf_map(bufnr, 'n', 'gh', ':Lspsaga lsp_finder<CR>')
  u.buf_map(bufnr, 'n', '<leader>o', ':Lspsaga outline<CR>')

  --- LSP Telescope mappings
  u.buf_map(bufnr, 'n', '<leader>gr', ':Telescope lsp_references<CR>')
  u.buf_map(bufnr, 'n', '<leader>td', ':Telescope lsp_type_definitions<CR>')
  u.buf_map(bufnr, 'n', '<leader>ca', ':Lspsaga code_action<CR>')

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.buf.inlay_hint(bufnr, true)
  end

  if client.supports_method('textDocument/formatting') then
    u.buf_command(bufnr, 'LspFormatting', function()
      lsp_formatting(bufnr)
    end)

    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      command = 'LspFormatting',
    })
  end
end

local capabilities = lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities()

-- setup language servers from server name
for _, server in ipairs({
  'tsserver',
  'csharp_ls',
  'go',
  'clangd',
  'rust_analyzer',
  'bashls',
  'pylsp',
  'css',
  'cssmodules',
  'astro',
  'tailwind',
  'svelte',
  'ocaml',
  'rell',
  'solidity',
  -- 'graphql',
  -- 'denols',
}) do
  require('modules.lsp.' .. server).setup(on_attach, capabilities)
end
