local attach = function(output_bufnr, pattern, command)
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('RunAug', { clear = true }),
    pattern = pattern,
    callback = function()
      local append = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
        end
      end

      vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, { 'Runtime output: ' })
      vim.fn.jobstart(command, {
        stdout_buffered = true,
        on_stdout = append,
        on_stderr = append,
      })
    end,
  })
end

vim.api.nvim_create_user_command('AutoRun', function()
  local bufnr = vim.fn.input('Buffer: ')
  local pattern = vim.fn.input('Pattern: ')
  local command = vim.split(vim.fn.input('Command: '), ' ')
  attach(tonumber(bufnr), pattern, command)
end, {})
