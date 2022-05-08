local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
local omnisharp_bin = '~/.local/share/nvim/lsp_servers/omnisharp/omnisharp/OmniSharp'

require('nvim-lsp-installer').setup({
  ensure_installed = {
    'omnisharp',
  },
})
