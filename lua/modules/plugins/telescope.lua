require('telescope').setup({
    defaults = {
        prompt_prefix = '❯ ',
        selection_caret = '❯ ',
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
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
})
