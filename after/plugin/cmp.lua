local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
  return
end

local check_backspace = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

require('luasnip.loaders.from_vscode').lazy_load({
  paths = { vim.fn.stdpath('config') .. '/lua/modules/core/snip/vs' },
})

vim.opt.completeopt = 'menu,menuone,noselect'

local function get_lsp_completion_context(completion, source)
  local ok, source_name = pcall(function()
    return source.source.client.config.name
  end)
  if not ok then
    return nil
  end

  if source_name == 'tsserver' then
    return completion.detail
  elseif source_name == 'pyright' and completion.labelDetails ~= nil then
    return completion.labelDetails.description
  elseif source_name == 'texlab' then
    return completion.detail
  elseif source_name == 'clangd' then
    local doc = completion.documentation
    if doc == nil then
      return
    end

    local import_str = doc.value

    local i, j = string.find(import_str, '["<].*[">]')
    if i == nil then
      return
    end

    return string.sub(import_str, i, j)
  end
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      if not require('cmp.utils.api').is_cmdline_mode() then
        local abbr_width_max = 25
        local menu_width_max = 20

        local choice = require('lspkind').cmp_format({
          ellipsis_char = '…',
          maxwidth = abbr_width_max,
          mode = 'symbol',
          before = require('tailwind-tools.cmp').lspkind_format,
        })(entry, vim_item)

        choice.abbr = vim.trim(choice.abbr)

        -- give padding until min/max width is met
        -- https://github.com/hrsh7th/nvim-cmp/issues/980#issuecomment-1121773499
        local abbr_width = string.len(choice.abbr)
        if abbr_width < abbr_width_max then
          local padding = string.rep(' ', abbr_width_max - abbr_width)
          vim_item.abbr = choice.abbr .. padding
        end

        local cmp_ctx = get_lsp_completion_context(entry.completion_item, entry.source)
        if cmp_ctx ~= nil and cmp_ctx ~= '' then
          choice.menu = cmp_ctx
        else
          choice.menu = ''
        end

        local menu_width = string.len(choice.menu)
        if menu_width > menu_width_max then
          choice.menu = vim.fn.strcharpart(choice.menu, 0, menu_width_max - 1)
          choice.menu = choice.menu .. '…'
        else
          local padding = string.rep(' ', menu_width_max - menu_width)
          choice.menu = padding .. choice.menu
        end
        return choice
      else
        local abbr_width_min = 20
        local abbr_width_max = 50

        local choice = require('lspkind').cmp_format({
          ellipsis_char = '…',
          maxwidth = abbr_width_max,
          mode = 'symbol',
        })(entry, vim_item)

        choice.abbr = vim.trim(choice.abbr)

        -- give padding until min/max width is met
        -- https://github.com/hrsh7th/nvim-cmp/issues/980#issuecomment-1121773499
        local abbr_width = string.len(choice.abbr)
        if abbr_width < abbr_width_min then
          local padding = string.rep(' ', abbr_width_min - abbr_width)
          vim_item.abbr = choice.abbr .. padding
        end

        return choice
      end
    end,
    expandable_indicator = false,
  },
  sources = {
    { name = 'luasnip', priority = 20 },
    { name = 'nvim_lsp', priority = 10 },
    { name = 'nvim_lua' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = cmp.config.window.bordered({ border = 'single' }),
    documentation = cmp.config.window.bordered({ border = 'single' }),
  },
  experimental = {
    ghost_text = true,
  },
  view = {
    entries = 'custom',
    selection_order = 'near_cursor',
  },
})

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

local ok, nvim_autopairs = pcall(require, 'nvim-autopairs')

if not ok then
  return
end

nvim_autopairs.setup()
