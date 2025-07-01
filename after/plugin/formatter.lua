local ok, formatter = pcall(require, 'formatter')

if not ok then
  return
end

local ok_util, util = pcall(require, 'formatter.util')

if not ok_util then
  return
end

formatter.setup({
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require('formatter.filetypes.lua').stylua,

      -- You can also define your own configuration
      function()
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == 'special.lua' then
          return nil
        end

        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = 'stylua',
          args = {
            '--search-parent-directories',
            '--stdin-filepath',
            util.escape_path(util.get_current_buffer_file_path()),
            '--',
            '-',
          },
          stdin = true,
        }
      end,
    },
    typescript = {
      require('formatter.filetypes.typescript').prettier,
    },
    javascript = {
      require('formatter.filetypes.javascript').prettier,
    },
    typescriptreact = {
      require('formatter.filetypes.typescriptreact').prettier,
    },
    javascriptreact = {
      require('formatter.filetypes.javascriptreact').prettier,
    },
    css = {
      require('formatter.filetypes.css').prettier,
    },
    yaml = {
      require('formatter.filetypes.yaml').prettier,
    },
    ['*'] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require('formatter.filetypes.any').remove_trailing_whitespace,
    },
  },
})
