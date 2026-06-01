local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
_G.theme = 'nordic'

require('config.options')
require('config.keymaps')
require('config.autocmds')

require('lazy').setup({
  { import = 'plugins' },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

if _G.theme == 'nordic' then
  require('config.themes.nordic')
elseif _G.theme == 'gruvbox' then
  require('config.themes.gruvbox')
elseif _G.theme == 'oxocarbon' then
  require('config.themes.oxocarbon')
elseif _G.theme == 'github' then
  require('config.themes.github')
end
