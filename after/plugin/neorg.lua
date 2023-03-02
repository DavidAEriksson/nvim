require('neorg').setup({
  load = {
    ['core.defaults'] = {}, -- Loads default behaviour
    ['core.norg.concealer'] = {}, -- Adds pretty icons to your documents
    ['core.norg.dirman'] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = '~/Development/notes',
        },
      },
    },
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
  },
})
