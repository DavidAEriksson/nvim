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
git clone https://github.com/DavidAEriksson/nvim.git ~/.config/nvim
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

### Showcase

#### Alpha

<details>
    <summary>Custom welcome screen</summary>
    <img width="2056" alt="Screenshot 2023-04-06 at 10 54 40" src="https://user-images.githubusercontent.com/33936705/230327842-96ef582a-fa8a-4e22-831b-aeb3061dd44d.png">
</details>

#### Telescope

<details>
    <summary>Flat theme</summary>
    <img width="2056" alt="Screenshot 2023-04-06 at 10 56 09" src="https://user-images.githubusercontent.com/33936705/230327826-452fa042-f0bc-4220-a554-6498a47681cf.png">
</details>

#### Saga

<details>
    <summary>peek_definition example</summary>
    <img width="2056" alt="Screenshot 2023-04-06 at 10 56 44" src="https://user-images.githubusercontent.com/33936705/230327805-76f5181f-3537-451a-bd76-99d6d59b865d.png">
</details>

#### Transparent terminal emulator

In Kitty:

<details>
    <summary>Kitty with <code>background_opacity 0.7</code></summary>
    <img width="2056" alt="Screenshot 2023-04-06 at 11 00 11" src="https://user-images.githubusercontent.com/33936705/230328381-98ffcb3f-27c3-4e83-b667-9d6316d955b1.png">
</details>
