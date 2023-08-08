local ok, lint = pcall(require, 'lint')

if not ok then
  return
end

lint.linters_by_ft = {
  typescript = { 'eslint' },
  typescriptreact = { 'eslint' },
  javascript = { 'eslint' },
  javascriptreact = { 'eslint' },
}
