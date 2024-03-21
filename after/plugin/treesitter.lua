require('nvim-treesitter.install').compilers = { 'gcc-12' }
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'lua',
    'typescript',
    'tsx',
    'json',
    'css',
    'html',
    'javascript',
    'markdown',
    'markdown_inline',
    'rust',
    'vimdoc',
  }, -- you can also do ensure_installed = 'all'
  sync_install = false,
  ignore_install = {},
  modules = {},
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(_, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local filename = vim.api.nvim_buf_get_name(buf)
      local ok, stats = pcall(vim.uv.fs_stat, filename)
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      scope_incremental = '<S-CR>',
      node_decremental = '<BS>',
    },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
})
