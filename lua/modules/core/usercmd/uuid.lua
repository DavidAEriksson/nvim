local random = math.random

local function uuid()
  local template = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
  return string.gsub(template, '[xy]', function(c)
    local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
    return string.format('%x', v)
  end)
end

vim.api.nvim_create_user_command('UUIDGen', function()
  local uuid_string = uuid()
  vim.api.nvim_buf_set_lines(0, 0, 0, false, { uuid_string })
end, {})
