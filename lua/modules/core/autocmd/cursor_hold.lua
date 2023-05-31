vim.api.nvim_create_autocmd('CursorHold', {
  buffer = 0,
  callback = function()
    local float_opts = {
      focusable = true,
      close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
      border = 'single',
      source = 'always',
      prefix = ' ',
      scope = 'line',
      pad_top = 1,
      pad_bottom = 1,
    }
    vim.diagnostic.open_float(nil, float_opts)
  end,
})
