-- statusline

-- https://github.com/nvim-lualine/lualine.nvim

local modes = {
  'mode',
  separator = { left = '', right = '' },
}

local branch = {
  'branch',
}

local space = {
  color = { bg = '#25363B', fg = '#25363B' },
  function()
    return ' '
  end,
}

local filename = {
  'filename',
  color = { bg = '#7C4DFF', fg = '#1C2C30' },
  separator = { left = '', right = '' },
}

local filetype = {
  'filetype',
  icon_only = true,
  colored = true,
  color = { bg = '#7C4DFF', fg = '#1C2C30' },
  separator = { left = '', right = '' },
}

local diagnostics = {
  'diagnostics',
  separator = { left = '', right = '' },
}

local lsp = {
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return '  ' .. client.name
      end
    end
    return '  ' .. msg
  end,
  separator = { left = '', right = '' },
  color = { bg = '#7C4DFF', fg = '#1C2C30' },
}

local config = {
  options = {
    icons_enabled = true,
    theme = 'material',
    component_separators = '|',
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      modes,
    },
    lualine_b = { space },
    lualine_c = { filename, filetype, branch },
    lualine_x = { diagnostics, lsp },
    lualine_y = { 'progress' },
    lualine_z = {
      { 'location', separator = { left = '', right = '' } },
    },
  },
  extensions = {
    'quickfix',
    'nvim-tree',
  },
}

require('lualine').setup(config)
