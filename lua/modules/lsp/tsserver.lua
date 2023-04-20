local u = require('utils')

local ts_utils_settings = {
  import_all_scan_buffers = 100,
  update_imports_on_move = true,
  filter_out_diagnostics_by_code = { 80001 },
}

local M = {}

M.setup = function(on_attach, capabilities)
  local lspconfig = require('lspconfig')
  local ts_utils = require('nvim-lsp-ts-utils')

  lspconfig['tsserver'].setup({
    root_dir = lspconfig.util.root_pattern('package.json'),
    init_options = ts_utils.init_options,
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)

      ts_utils.setup(ts_utils_settings)
      ts_utils.setup_client(client)

      u.buf_map(bufnr, 'n', 'gO', ':TSLspOrganize<CR>')
      u.buf_map(bufnr, 'n', 'gR', ':TSLspRenameFile<CR>')
      u.buf_map(bufnr, 'n', 'gI', ':TSLspImportAll<CR>')

      client.server_capabilities.document_formatting = false
    end,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
    handlers = {
      ['textDocument/publishDiagnostics'] = function(_, result, ctx, config)
        if result.diagnostics == nil then
          return
        end

        -- ignore some tsserver diagnostics
        local idx = 1
        while idx <= #result.diagnostics do
          local entry = result.diagnostics[idx]

          local formatter = require('format-ts-errors')[entry.code]
          entry.message = formatter and formatter(entry.message) or entry.message

          -- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
          if entry.code == 80001 then
            -- { message = "File is a CommonJS module; it may be converted to an ES module.", }
            table.remove(result.diagnostics, idx)
          else
            idx = idx + 1
          end
        end

        vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
      end,
    },
  })
end

return M
