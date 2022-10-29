local ok, neogit = pcall(require, 'neogit')

if not ok then
  return
end

neogit.setup({})
