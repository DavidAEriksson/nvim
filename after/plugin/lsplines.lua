local ok, lsplines = pcall(require, 'lsp_lines')

if not ok then
  print('Failed to load LSP Lines: Will not display inline diagnostics.')
  return
end

lsplines.setup()
