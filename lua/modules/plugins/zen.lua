require('true-zen').setup({
  modes = {
    ataraxis = {
      shade = 'dark',
      backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
      minimum_writing_area = { -- minimum size of main window
        width = 70,
        height = 44,
      },
      quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
      padding = { -- padding windows
        left = 52,
        right = 52,
        top = 0,
        bottom = 0,
      },
    },
  },
})
