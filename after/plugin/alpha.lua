local ok_alpha, alpha = pcall(require, 'alpha')
if not ok_alpha then
  return
end

local ok_dash, dashboard = pcall(require, 'alpha.themes.dashboard')
if not ok_dash then
  return
end

local plugins_count = vim.fn.len(vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))

local function footer()
  local datetime = os.date(' %d-%m-%Y   %H:%M:%S')
  local version = vim.version()
  local nvim_version_info = '   v' .. version.major .. '.' .. version.minor .. '.' .. version.patch
  return datetime .. nvim_version_info .. '   ' .. plugins_count
end

-- Set header
dashboard.section.header.opts.position = 'center'
dashboard.section.header.val = {
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '                                   ',
  '   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ',
  '    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
  '          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ',
  '           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
  '          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
  '   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
  '  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
  ' ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
  ' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ',
  '      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
  '       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
  '                                   ',
  '              Neovim               ',
}

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>', {}),
  dashboard.button('f', '  > Find file', ':Telescope find_files<CR>', {}),
  dashboard.button('r', '  > Recent', ':Telescope oldfiles<CR>', {}),
  dashboard.button('g', '  > Grep', ':Telescope live_grep<CR>', {}),
  dashboard.button('s', '  > Settings', ':e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR>', {}),
  dashboard.button('p', '  > Sync all (' .. plugins_count .. ') plugins', ':PackerSync<CR>', {}),
  dashboard.button('q', '  > Quit NVIM', ':qa<CR>', {}),
}

dashboard.section.footer.val = footer()
-- Send config to alpha
alpha.setup(dashboard.opts)
