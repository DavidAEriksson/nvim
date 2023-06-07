local ok, edgy = pcall(require, 'edgy')

if not ok then
  return
end

edgy.setup({
  bottom = {
    {
      ft = 'trouble',
      size = { height = 0.2 },
      -- exclude floating windows
      filter = function(buf, win)
        return vim.api.nvim_win_get_config(win).relative == ''
      end,
    },
  },
  left = {
    -- Neo-tree filesystem always takes half the screen height
    {
      title = 'Neo-Tree',
      ft = 'neo-tree',
      filter = function(buf)
        return vim.b[buf].neo_tree_source == 'filesystem'
      end,
      size = { height = 0.5 },
    },
    {
      title = 'Neo-Tree Git',
      ft = 'neo-tree',
      filter = function(buf)
        return vim.b[buf].neo_tree_source == 'git_status'
      end,
      pinned = true,
      open = 'Neotree position=right git_status',
    },
    'neo-tree',
  },
  right = {
    title = 'Lspsaga Outline',
    open = 'Lspsaga outline',
  },
})
