-- We can pass configuration options to the setup function if we want to, it
-- is not really necessary though.
local luadev = require('lua-dev').setup({})

local lspconfig = require('lspconfig')
lspconfig.sumneko_lua.setup(luadev)
