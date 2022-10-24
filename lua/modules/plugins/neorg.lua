require('neorg').setup({
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
