vim.g.material_style = 'darker'

require('material').setup({
    italics = {
        comments = true,
        functions = true,
    },
    contrast_filetypes = {
        'terminal',
        'packer',
        'qf',
    },
    high_visibility = {
        lighter = false,
        darker = false,
    },
    disable = {
        background = true,
    },
})

vim.cmd([[colorscheme material]])
