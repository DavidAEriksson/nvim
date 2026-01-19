local ok, nordic = pcall(require, 'nordic')

if not ok then
  return
end

nordic.setup({
  bold_keywords = true,
  italic_comments = true,
  transparent = {
    bg = false,
    float = false,
  },
  bright_border = false,
  -- Reduce the overall amount of blue in the theme (diverges from base Nord).
  reduced_blue = true,
  -- Swap the dark background with the normal one.
  swap_backgrounds = false,
  -- Cursorline options.  Also includes visual/selection.
  cursorline = {
    -- Bold font in cursorline.
    bold = false,
    -- Bold cursorline number.
    bold_number = true,
    -- Available styles: 'dark', 'light'.
    theme = 'dark',
    -- Blending the cursorline bg with the buffer bg.
    blend = 0.85,
  },
  noice = {
    -- Available styles: `classic`, `flat`.
    style = 'flat',
  },
  telescope = {
    -- Available styles: `classic`, `flat`.
    style = 'flat',
  },
  ts_context = {
    -- Enables dark background for treesitter-context window
    dark_background = true,
  },
})

vim.cmd('colorscheme nordic')

-- vim.api.nvim_set_hl(0, 'PMenuSel', { bg = '#D89079', fg = '#282c34' })
-- vim.api.nvim_set_hl(0, 'PMenuThumb', { bg = '#D89079' })
-- vim.api.nvim_set_hl(0, 'Visual', { bg = '#EBCB8B', fg = '#242933' })
vim.api.nvim_set_hl(0, 'DropBarMenuCurrentContext', { bg = '#D89079' })
vim.api.nvim_set_hl(0, 'WinBar', { bg = '#242933' })
vim.api.nvim_set_hl(0, 'WinBarNC', { bg = '#242933' })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = '#21262f', fg = '#21262f' })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = '#1d2129', fg = '#1d2129' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = '#1d2129', fg = '#1d2129' })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'None' })
-- vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = '#242933', fg = '#242933' })
-- vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#D89079' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#242933' })
-- vim.api.nvim_set_hl(0, 'SagaNormal', { bg = '#242933' })
-- vim.api.nvim_set_hl(0, 'SagaBorder', { bg = '#242933', fg = '#D89079' })
