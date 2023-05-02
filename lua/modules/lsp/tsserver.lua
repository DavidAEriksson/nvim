local M = {}

M.setup = function(on_attach, capabilities)
  local lspconfig = require('lspconfig')
  require('typescript').setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    go_to_source_definition = {
      fallback = true, -- fall back to standard LSP definition on failure
    },
    server = {
      root_dir = lspconfig.util.root_pattern('package.json'),
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
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
    },
  })
end

return M
