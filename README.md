<div align="center">
  <h1 align="center">Neovim Lua Config</h1>
  <h6>LSP, Treesitter, sane defaults</h6>

[![Lua](https://img.shields.io/badge/Lua-blue.svg?style=for-the-badge&logo=lua)](http://www.lua.org)

</div>

#### Make sure that the folder `nvim` exists within your `~/.config` directory before proceeding, if not, create it:

```
mkdir ~/.config/nvim
```

#### Clone this repository

This will clone the repository directly into your `nvim config` folder:

```
git clone https://github.com/DavidAEriksson/nvim-config.git ~/.config/nvim
```

### Package manager

The config uses Packer as the package manager. All installed packages can be found in `lua/modules/plugins/pack.lua`. On clone you need to run `:PackerSync` to install all dependencies.

### Install language servers (LSP)

Additional language servers can be installed through `nvim-lsp-installer` and invoking `LspInstall <server>`. In `lua/modules/lsp/init.lua` servers are dynamically handled through this block of Lua script:

```lua
for _, server in ipairs({
    'tsserver',
    'null-ls',
    'omnisharp',
    -- ...
}) do
    require('modules.lsp' .. server).setup(on_attach, capabilities)
end
```

#### Lua LSP

The Lua LSP available through `sumneko_lua` requires a different installation setup:

1. Install `sumneko_lua` with `brew install lua-language-server`
2. Install `stylua` to handle formatting:
   1. Install `cargo`: `curl https://sh.rustup.rs -sSf | sh`
   2. Install `stylua`: `cargo install stylua`
