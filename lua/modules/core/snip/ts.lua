local ok, ls = pcall(require, 'luasnip')

if not ok then
  print('Failed to load luasnip.')
  return
end

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets('typescript', {
  s({ trig = 'type', dscr = 'Type Statement' }, {
    t('type '),
    i(1, 'name'),
    t({ ' = {', '\t' }),
    i(2, 'property'),
    t(': '),
    i(3, 'type'),
    t({ '\t', '}' }),
  }),
})

ls.add_snippets('typescript', {
  s({ trig = 'interface', dscr = 'Interface Statement' }, {
    t('interface '),
    i(1, 'name'),
    t({ ' {', '\t' }),
    i(2, 'property'),
    t(': '),
    i(3, 'type'),
    t({ '\t', '}' }),
  }),
})

ls.filetype_extend('typescript', { 'typescriptreact' })
