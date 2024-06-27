local ok, cokeline = pcall(require, 'cokeline')

if not ok then
  return
end

local dark_bg
local inactive_bg
local bg
local fg
local inactive_fg
local title
local error
local warn

if _G.theme == 'nordic' then
  local P = require('nordic.colors')
  local blend = require('nordic.utils').blend
  dark_bg = P.black0
  fg = P.fg
  bg = P.bg
  title = P.yellow.base
  error = P.error
  warn = P.warn
  inactive_fg = P.gray4
  inactive_bg = blend(P.bg, P.black0, 0.4)
end

if _G.theme == 'gruvbox' then
  local colors = require('gruvbox-baby.colors').config()
  dark_bg = colors.background_dark
  fg = colors.blue_gray
  bg = colors.background
  title = colors.soft_yellow
  error = colors.error_red
  warn = colors.orange
end

cokeline.setup({
  default_hl = {
    fg = function(buffer)
      return buffer.is_focused and fg or inactive_fg
    end,
    bg = function(buffer)
      return buffer.is_focused and bg or inactive_bg
    end,
    bold = function(buffer)
      return buffer.is_focused and true or false
    end,
    italic = function(buffer)
      return buffer.is_focused and true or false
    end,
  },
  sidebar = {
    filetype = 'neo-tree',
    components = {
      {
        text = '         󰙅 Explorer',
        fg = title,
        bg = inactive_bg,
        style = 'bold',
      },
    },
  },
  components = {
    {
      text = function(buffer)
        return ''
      end,
      underline = false,
      bg = dark_bg,
      sp = dark_bg,
    },
    {
      text = function(buffer)
        return (buffer.index ~= 1) and '  ' or '   '
      end,
      underline = false,
      fg = dark_bg,
      sp = dark_bg,
    },
    {
      text = function(buffer)
        if buffer.diagnostics.errors ~= 0 then
          return ' '
        end
        if buffer.diagnostics.warnings ~= 0 then
          return ' '
        end
        return buffer.devicon.icon
      end,
      fg = function(buffer)
        if buffer.diagnostics.errors ~= 0 then
          return error
        end
        if buffer.diagnostics.warnings ~= 0 then
          return warn
        end
        return buffer.is_focused and buffer.devicon.color
      end,
      underline = false,
      sp = dark_bg,
    },
    {
      text = ' ',
      underline = false,
      sp = dark_bg,
    },
    {
      text = function(buffer)
        return buffer.filename .. '  '
      end,
      underline = false,
      sp = dark_bg,
    },
    {
      text = function(buffer)
        if buffer.is_readonly then
          return ''
        end
        if buffer.is_modified then
          return '⦿'
        end
        return '✗'
      end,
      delete_buffer_on_left_click = true,
      underline = false,
      sp = dark_bg,
    },
    {
      text = '   ',
      underline = false,
      sp = dark_bg,
    },
  },
})
