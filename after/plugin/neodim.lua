local ok, neodim = pcall(require, 'neodim')

if not ok then
  return
end

neodim.setup({
  alpha = 0.45,
  blend_color = '#1e222a',
  hide = {
    virtual_text = true,
    signs = true,
    underline = true,
  },
})
