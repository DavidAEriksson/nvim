local ok, neorg = pcall(require, 'neorg')

if not ok then
  return
end

neorg.setup({
  load = {
    ['core.defaults'] = {},
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          work = '~/Development/notes/work',
        },
      },
    },
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
    ['core.norg.concealer'] = {},
    ['core.presenter'] = {
      config = {
        zen_mode = 'truezen',
      },
    },
  },
})
