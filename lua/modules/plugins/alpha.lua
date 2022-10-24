local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
local plugins_count = vim.fn.len(vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))

local function footer()
  local datetime = os.date(' %d-%m-%Y   %H:%M:%S')
  local version = vim.version()
  local nvim_version_info = '   v' .. version.major .. '.' .. version.minor .. '.' .. version.patch
  return datetime .. nvim_version_info .. '   ' .. plugins_count
end

-- Set header
dashboard.section.header.val = {
  '      .            .      ',
  "    .,;'           :,.    ",
  '  .,;;;,,.         ccc;.  ',
  ".;c::::,,,'        ccccc: ",
  '.::cc::,,,,,.      cccccc.',
  ".cccccc;;;;;;'     llllll.",
  '.cccccc.,;;;;;;.   llllll.',
  ".cccccc  ';;;;;;'  oooooo.",
  "'lllllc   .;;;;;;;.oooooo'",
  "'lllllc     ,::::::looooo'",
  "'llllll      .:::::lloddd'",
  '.looool       .;::coooodo.',
  "  .cool         'ccoooc.  ",
  '    .co          .:o:.    ',
  "      .           .'      ",
  '          Neovim          ',
}

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>', {}),
  dashboard.button('f', '  > Find file', ':Telescope find_files<CR>', {}),
  dashboard.button('r', '  > Recent', ':Telescope oldfiles<CR>', {}),
  dashboard.button('g', '  > Grep', ':Telescope live_grep<CR>', {}),
  dashboard.button('s', '  > Settings', ':e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>', {}),
  dashboard.button('p', '  > Sync all (' .. plugins_count .. ') plugins', ':PackerSync<CR>', {}),
  dashboard.button('q', '  > Quit NVIM', ':qa<CR>', {}),
}

dashboard.section.footer.val = footer()
-- Send config to alpha
alpha.setup(dashboard.opts)
