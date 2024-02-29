local M = {}

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

local append_testcases = function(log_content, pattern, testcases, line_numbers)
  for testcase, name in log_content:gmatch(pattern) do
    local test_information = {
      testcase = testcase,
      name = name,
      linenumber = line_numbers[name] and line_numbers[name].line or nil,
      fail = pattern == '(name="([^"]+)")(>)' and true or false,
      message = nil,
    }
    table.insert(testcases, test_information)
  end
end

local reverse_table = function(tbl)
  local reversed = {}
  for i = #tbl, 1, -1 do
    table.insert(reversed, tbl[i])
  end

  return reversed
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
      local log_file = io.open('./build/reports/rell-unit-tests.xml', 'r')
      if log_file then
        local testcases = {}
        local errors = {}
        local log_content = log_file:read('*all')

        local success_pattern = '(name="([^"]+)")(/>)'
        local failure_pattern = '(name="([^"]+)")(>)'
        append_testcases(log_content, success_pattern, testcases, line_numbers)
        append_testcases(log_content, failure_pattern, testcases, line_numbers)

        local failure_message_pattern = 'failure message="([^"]*)"'
        for message in log_content:gmatch(failure_message_pattern) do
          local msg = ' ' .. message:gsub('&apos;', "'"):gsub('&quot;', '"'):gsub('&lt;', '<'):gsub('&gt;', '>')
          table.insert(errors, msg)
        end

        local testcases_reversed = reverse_table(testcases)

        for k, v in pairs(testcases_reversed) do
          if v.fail then
            v.message = reverse_table(errors)[k]
          end
        end

        testcases = testcases_reversed
        M.testcases = testcases

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

vim.api.nvim_create_user_command('RellTestRemoveDiagnostics', function()
  vim.diagnostic.reset(ns, 0)
end, {})

vim.api.nvim_create_user_command('RellTestResults', function()
  local split = require('nui.split')
  local r_split = split({
    relative = 'editor',
    position = 'right',
    size = '50%',
  })
  r_split:mount()
  vim.keymap.set('n', 'q', function()
    r_split:unmount()
  end, { silent = true })
  vim.api.nvim_buf_set_lines(r_split.bufnr, 0, -1, false, { ' Test results  ' })
  vim.api.nvim_buf_set_lines(r_split.bufnr, 1, -1, false, { '----------------' })
  if M.testcases == nil or next(M.testcases) == nil then
    require('notify')('No testcases found', 'warn', {
      title = 'Rell test runner  ',
      timeout = 300,
    })
    return
  end
  vim.api.nvim_buf_set_lines(
    r_split.bufnr,
    2,
    -1,
    false,
    vim.tbl_map(function(testcase)
      return 'Test '
        .. '**'
        .. testcase.name
        .. '**'
        .. ':'
        .. (testcase.message and ' **FAILED:** ' .. testcase.message:gsub(' ', '') or '   Test passed.')
    end, M.testcases)
  )
  vim.api.nvim_set_option_value('modifiable', false, { buf = r_split.bufnr })
  vim.api.nvim_set_option_value('filetype', 'markdown', { buf = r_split.bufnr })
  vim.cmd('set conceallevel=3')
end, {})

vim.api.nvim_create_user_command('RellNewProject', function()
  local project_name =
    vim.fn.input({ prompt = 'Enter project name (or <CR> for default name "my_rell_dapp"): ', default = '' })
  vim.fn.jobstart('chr create-rell-dapp ' .. project_name, {
    on_exit = function(_, data, _)
      if data == 0 then
        vim.print('Project ' .. project_name .. ' created at location: ' .. vim.fn.getcwd() .. '/' .. project_name)
      else
        vim.print('Error creating project, name ' .. project_name .. ' might already exist.')
      end
    end,
  })
end, {})

vim.api.nvim_create_user_command('RellGenerateStubs', function()
  local stubs = {
    { 1, 'kotlin' },
    { 2, 'mermaid' },
    { 3, 'typescript' },
    { 4, 'javascript' },
  }
  local type = vim.fn.inputlist({
    'Select type of stubs to generate: ',
    '1. kotlin',
    '2. mermaid',
    '3. typescript',
    '4. javascript',
  })
  local kt_packagename = ''
  if stubs[type][2] == 'kotlin' then
    kt_packagename = vim.fn.input({ prompt = '(Kotlin) Enter package name: ' })
  end
  local mermaid_type = ''
  if stubs[type][2] == 'mermaid' then
    local mermaid_type_select = vim.fn.inputlist({
      'Select type of mermaid stubs to generate: ',
      '1. Entity Relationship Diagram',
      '2. Class Diagram',
    })
    mermaid_type = mermaid_type_select == 1 and '--entity-relation' or '--class-diagram'
  end
  if vim.fn.getcwd() .. 'chromia.yml' then
    local command = 'chr generate-client-stubs --' .. stubs[type][2]
    if kt_packagename ~= '' then
      command = command .. ' --package ' .. kt_packagename
    end
    if mermaid_type ~= '' then
      command = command .. ' ' .. mermaid_type
    end
    vim.fn.jobstart(command, {
      on_exit = function(_, data, _)
        if data == 0 then
          vim.print('Stubs generated.')
        else
          vim.print('Error generating stubs.')
        end
      end,
    })
  else
    vim.print('No chromia.yml found in current directory.')
  end
end, {})
