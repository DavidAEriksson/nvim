local ok, silicon = pcall(require, 'silicon')
if not ok then
  print('Error loading silicon')
  return
end

silicon.setup({})
