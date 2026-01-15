## Clone config

`git clone https://github.com/nocturnalq/nvim-config.git ~/.config/nvim`

## Install vim-plug

```sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' 
```

## Run Vim and install deps

`:PlugInstall`

## LazyGit

- Install the `lazygit` binary (you already did)
- Install the Neovim plugin: run `:PlugInstall`
- Open LazyGit inside Neovim: `:LazyGit` (default keymap: `<leader>gg`)

## How to

### use Telescope

```
\ + f - find files
\ + g - find something in file 
```

### use Comment
`shift+v + j/k and than 'gc' - comment and uncomment files`
