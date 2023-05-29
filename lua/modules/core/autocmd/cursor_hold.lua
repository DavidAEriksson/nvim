vim.api.nvim_create_autocmd('CursorHold', {
  buffer = 0,
  callback = function()
    local float_opts = {
      focusable = true,
      close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
    }

    if not vim.b.diagnostics_pos then
      vim.b.diagnostics_pos = { nil, nil }
    end

    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    if
      (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
      and #vim.diagnostic.get() > 0
    then
      vim.diagnostic.open_float(nil, float_opts)
    end

    vim.b.diagnostics_pos = cursor_pos
  end,
})
