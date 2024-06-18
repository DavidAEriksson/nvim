local ok, tailwind = pcall(require, 'tailwind-tools')

if not ok then
  return
end

tailwind.setup({})
