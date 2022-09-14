require('telescope').setup({
  picker = {
    hidden = false,
    layout_config = {
      scroll_speed = 1,
    },
  },
  defaults = {
    prompt_prefix = '   ',
    selection_caret = '❯ ',
    entry_prefix = '  ',
    sorting_strategy = 'ascending',
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore',
      '--hidden',
      '-g',
      '!.git',
    },
    mappings = {
      i = {
        ['<ESC>'] = require('telescope.actions').close,
        ['<C-u>'] = require('telescope.actions').preview_scrolling_up,
        ['<C-d>'] = require('telescope.actions').preview_scrolling_down,
      },
    },
    initial_mode = 'insert',
    selection_strategy = 'reset',
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
      scroll_speed = 1,
    },
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    path_display = { 'truncate' },
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
  },
})

local extensions = { 'themes', 'terms' }

pcall(function()
  for _, ext in pairs(extensions) do
    require('telescope').load_extension(ext)
  end
end)
