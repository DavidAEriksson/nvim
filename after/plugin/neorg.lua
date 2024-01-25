local ok, neorg = pcall(require, 'neorg')

if not ok then
  return
end

neorg.setup({
  load = {
    ['core.defaults'] = {}, -- Loads default behaviour
    ['core.concealer'] = {}, -- Adds pretty icons to your documents
    ['core.dirman'] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = '~/Development/notes',
          work = '~/Development/notes/work',
          work_2024 = '~/Development/notes/work/2024',
        },
      },
    },
    ['core.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
  },
})
