local u = require('utils')
local lsp = vim.lsp
local api = vim.api
local fn = vim.fn
local border_opts = { border = 'rounded', focusable = true, scope = 'line' }

vim.diagnostic.config({ virtual_text = true, float = border_opts })
fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
fn.sign_define('DiagnosticSignInformation', { text = ' ', texthl = 'DiagnosticSignInfo' })

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local lsp_formatting = function(bufnr)
  lsp.buf.format({
    bufnr = bufnr,
    filter = function(client)
      if client.name == 'eslint' or client.name == 'rell' then
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

  u.buf_map(bufnr, 'n', '<leader>gr', ':Telescope lsp_references<CR>')
  u.buf_map(bufnr, 'n', '<leader>td', ':Telescope lsp_type_definitions<CR>')

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
capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

local lspconfig = vim.lsp.config

vim.lsp.config('ts_ls', {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config('bashls', {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config('pylsp', {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config('lua_ls', {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    diagnostics = {
      globals = { 'vim' },
    },
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.config('emmet_language_server', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    'css',
    'eruby',
    'html',
    'javascript',
    'javascriptreact',
    'less',
    'sass',
    'scss',
    'svelte',
    'pug',
    'typescriptreact',
    'vue',
  },
})

vim.lsp.config('yamlls', {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config('eslint', {
  on_attach = on_attach,
  capabilities = capabilities,
})
