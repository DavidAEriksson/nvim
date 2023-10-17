local ns = vim.api.nvim_create_namespace('rell_test')

local function split_lines(input)
  local lines = {}
  for line in input:gmatch('([^\r\n]*)\r?\n') do
    table.insert(lines, line)
  end
  return lines
end

local function find_function_line_numbers(file_content)
  local line_numbers = {}
  local current_function_name

  local lines = split_lines(file_content)
  for line_number, line_content in ipairs(lines) do
    local function_name = line_content:match('function%s+([%w_]+)%s*%(')
    if function_name then
      current_function_name = function_name
      line_numbers[current_function_name] = { name = function_name, line = line_number }
    end
  end
  return line_numbers
end

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*_test.rell',
  callback = function()
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
    local file_errors = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    if next(file_errors) ~= nil then
      require('notify')('Errors in file found, not running tests.', 'warn', {
        title = 'Rell test runner  ',
        timeout = 500,
      })
      return
    end
    require('notify')('Running tests...', 'info', {
      title = 'Rell test runner  ',
      timeout = 500,
    })
    local test_file_name = vim.fn.fnamemodify(vim.fn.expand('%:t'), ':r')
    local test_file = io.open(vim.api.nvim_buf_get_name(0), 'r'):read('*all')
    local line_numbers = find_function_line_numbers(test_file)

    local on_exit = function()
      local log_file = io.open('./build/reports/rell-tests.xml', 'r')
      if log_file then
        local testcases = {}
        local log_content = log_file:read('*all')

        local name_pattern = 'name="test%.([^:]+):([^"]+)"'
        local failure_pattern = 'failure%s+message%s*=%s*["\'](.-)["\']'

        for testcase, name in log_content:gmatch(name_pattern) do
          local test_information = {
            testcase = testcase,
            name = name,
            linenumber = line_numbers[name] and line_numbers[name].line or nil,
            message = nil,
          }

          table.insert(testcases, test_information)
        end

        for message, _ in log_content:gmatch(failure_pattern) do
          testcases[#testcases].message = ' '
            .. message:gsub('&apos;', "'"):gsub('&quot;', '"'):gsub('&lt;', '<'):gsub('&gt;', '>')
        end

        local diagnostics = {}
        for _, info in ipairs(testcases) do
          table.insert(diagnostics, {
            bufnr = 0,
            lnum = info.linenumber - 1,
            col = 0,
            severity = info.message and vim.diagnostic.severity.WARN or vim.diagnostic.severity.HINT,
            source = 'rell_test',
            message = info.message or '  Test passed.',
            user_data = {},
          })
        end
        vim.diagnostic.set(ns, 0, diagnostics, {})
      end
      require('notify')('Test run completed.', 'info', { title = 'Rell test runner  ', timeout = 500 })
    end

    vim.fn.jobstart('chr test -m test.' .. test_file_name .. ' --test-report', {
      on_exit = on_exit,
    })
  end,
})
