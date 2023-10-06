local ok, nordic = pcall(require, 'nordic')

if not ok then
  return
end

nordic.setup({
  telescope = {
    style = 'flat',
  },
  bold_keywords = true,
  italic_comments = true,
  reduced_blue = true,
  bright_border = false,
  noice = {
    style = 'flat',
  },
})

vim.cmd('colorscheme nordic')

vim.api.nvim_set_hl(0, 'PMenu', { bg = '#282c34' })
vim.api.nvim_set_hl(0, 'PMenuSel', { bg = '#D89079', fg = '#282c34' })
vim.api.nvim_set_hl(0, 'PMenuThumb', { bg = '#D89079' })
vim.api.nvim_set_hl(0, 'Visual', { bg = '#373b43' })
vim.api.nvim_set_hl(0, 'DropBarMenuCurrentContext', { bg = '#D89079' })
vim.api.nvim_set_hl(0, 'WinBar', { bg = '#242933' })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = '#21262f', fg = '#21262f' })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = '#1d2129', fg = '#1d2129' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = '#1d2129', fg = '#1d2129' })

local links = {
  ['@lsp.type.rell-module.rell'] = '@namespace',
  ['@lsp.type.rell-annotation.rell'] = '@namespace',
  ['@lsp.type.rell-namespace.rell'] = '@namespace',
  ['@lsp.type.rell-type.rell'] = '@type',
  ['@lsp.type.rell-enum.rell'] = '@lsp.type.enum',
  ['@lsp.type.rell-enum_value.rell'] = '@lsp.type.enumMember',
  ['@lsp.type.rell-struct.rell'] = '@type',
  ['@lsp.type.rell-struct_attr_val.rell'] = '@keyword',
  ['@lsp.type.rell-struct_attr_var.rell'] = '@parameter',
  ['@lsp.type.rell-tuple_attr.rell'] = '@parameter',
  ['@lsp.type.rell-entity.rell'] = '@type',
  ['@lsp.type.rell-object.rell'] = '@type',
  ['@lsp.type.rell-entity_attr_normal_val.rell'] = '@parameter',
  ['@lsp.type.rell-entity_attr_normal_var.rell'] = '@parameter',
  ['@lsp.type.rell-entity_attr_keyindex_val.rell'] = '@parameter',
  ['@lsp.type.rell-entity_attr_keyindex_var.rell'] = '@parameter',
  ['@lsp.type.rell-function.rell'] = '@function',
  ['@lsp.type.rell-extendable_function.rell'] = '@function.macro',
  ['@lsp.type.rell-operation.rell'] = '@function',
  ['@lsp.type.rell-query.rell'] = '@function',
  ['@lsp.type.rell-named_argument.rell'] = '@parameter',
  ['@lsp.type.rell-global_constant.rell'] = '@constant',
  ['@lsp.type.rell-local_val.rell'] = '@keyword',
  ['@lsp.type.rell-local_var.rell'] = '@keyword',
  ['@lsp.type.rell-at_alias.rell'] = '@type',
  ['@lsp.type.rell-default.rell'] = '@namespace',
}
for newgroup, oldgroup in pairs(links) do
  vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
end
