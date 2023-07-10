-- statusline
-- https://github.com/nvim-lualine/lualine.nvim

local modes = {
  'mode',
  separator = { left = '', right = '' },
}

local branch = {
  'branch',
}

local function theme_switch(bg_dark, fg_dark, bg_light, fg_light)
  if _G.theme == 'dark' then
    return { bg = bg_dark, fg = fg_dark }
  end
  if _G.theme == 'light' then
    return { bg = bg_light, fg = fg_light }
  end
end

local space = {
  color = theme_switch('#191D24', '#191D24', '#FFFFFF', '#FFFFFF'),
  function()
    return ' '
  end,
}

local filename = {
  'filename',
  color = theme_switch('#D08770', '#242933', '#8250df', '#FFFFFF'),
  separator = { left = '', right = '' },
}

local filetype = {
  'filetype',
  icon_only = true,
  colored = true,
  color = theme_switch('#D08770', '#242933', '#8250df', '#24292f'),
  separator = { left = '', right = '' },
}

local diagnostics = {
  'diagnostics',
  separator = { left = '', right = '' },
}

local function theme_name()
  if _G.theme == 'dark' then
    return 'nordic'
  end
  return 'github_light'
end

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
  color = theme_switch('#D08770', '#242933', '#218bff', '#24292f'),
}

local config = {
  options = {
    icons_enabled = true,
    theme = theme_name(),
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
    'neo-tree',
  },
}

require('lualine').setup(config)
