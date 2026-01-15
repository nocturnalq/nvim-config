## Clone config

`git clone https://github.com/nocturnalq/nvim-config.git ~/.config/nvim`

## Install vim-plug

```sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' 
```

## Run Vim and install deps

`:PlugInstall`

## LazyGit

- Install the `lazygit` binary
- Install the Neovim plugin: run `:PlugInstall`
- Open LazyGit inside Neovim: `:LazyGit` (default keymap: `<leader>gg`)

## Hotkeys / keymaps

Notes:
- `<leader>` is `\` by default (unless you set `mapleader` elsewhere)
- These are the keymaps defined in this repo + a few plugin defaults (see the articles: [Part 1](https://poltora.dev/neovim-for-developers/), [Part 2](https://poltora.dev/neovim-for-developers-2/))

### General (macOS Cmd-key combos)

These come from `nvim/combinations.lua` and are written as `<Char-0x..>` internally (WezTerm/macOS).

| Key | Action |
| --- | --- |
| `Cmd+s` | Save file (`:write`) |
| `Cmd+e` | Scroll down (`<C-e>`) |
| `Cmd+Shift+e` | Scroll up (`<C-y>`) |
| `Cmd+h` | Previous buffer/tab (`:BufferPrevious`) |
| `Cmd+l` | Next buffer/tab (`:BufferNext`) |
| `Cmd+w` | Close buffer/tab (`:BufferClose`) |
| `Cmd+t` | Reveal current file in tree (`:NvimTreeFindFile`) |
| `Cmd+1` | Toggle file tree (`:NvimTreeToggle`) |
| `Cmd+[` | Trouble: toggle diagnostics view (`:Trouble diagnostics toggle`) |
| `Cmd+]` | Trouble: close (`:TroubleClose`) |

### FZF-Lua

| Key | Action |
| --- | --- |
| `<leader>f` | Find files (`fzf-lua.files`) |
| `<leader>g` | Live grep (`fzf-lua.live_grep`) |

### Telescope

You have Telescope installed (`nvim-telescope/telescope.nvim`), but your current search keymaps use **fzf-lua** (section above).

Common Telescope commands (run with `:`):

| Command | Action |
| --- | --- |
| `:Telescope find_files` | Find files |
| `:Telescope live_grep` | Live grep (ripgrep) |
| `:Telescope buffers` | Buffers |
| `:Telescope help_tags` | Help tags |

If you want Telescope keymaps too, a typical setup is:
- `<leader>ff` → `:Telescope find_files`
- `<leader>fg` → `:Telescope live_grep`

### NvimTree

| Key | Action |
| --- | --- |
| `<C-n>` | Toggle tree (`:NvimTreeToggle`) |
| `<leader>e` | Focus tree (`:NvimTreeFocus`) |

### Trouble

| Key | Action |
| --- | --- |
| `<leader>xx` | Toggle Trouble |
| `<leader>xw` | Workspace diagnostics |
| `<leader>xd` | Document diagnostics |
| `<leader>xq` | Quickfix list |
| `<leader>xl` | Location list |
| `gR` | LSP references (Trouble view) |

### LazyGit

| Key | Action |
| --- | --- |
| `<leader>gg` | Open LazyGit (`:LazyGit`) |

### LSP (nvim-lspconfig)

Diagnostics:

| Key | Action |
| --- | --- |
| `<space>e` | Floating diagnostic |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<space>q` | Diagnostics to loclist |

When LSP attaches to a buffer:

| Key | Action |
| --- | --- |
| `gD` | Go to declaration |
| `gd` | Go to definition |
| `K` | Hover |
| `gi` | Go to implementation |
| `<C-k>` | Signature help |
| `<space>wa` | Add workspace folder |
| `<space>wr` | Remove workspace folder |
| `<space>wl` | List workspace folders |
| `<space>D` | Type definition |
| `<space>rn` | Rename |
| `<space>ca` | Code action |
| `gr` | References |
| `<space>f` | Format |

### Comment.nvim (plugin defaults)

| Key | Action |
| --- | --- |
| `gcc` | Toggle comment (line) |
| `gc` + motion | Toggle comment (motion), e.g. `gcj`, `gcap` |
| Visual mode `gc` | Toggle comment for selection |

Examples:
- **Comment a block**: `Shift+V` (linewise visual) → `j/k` to select lines → `gc`
- **Comment current line**: `gcc`
- **Comment next line too**: `gcj`
- **Comment a paragraph**: `gcap`

### Notes / Commands (no custom keymaps yet)

- **Barbar**: you’re using `:BufferNext`, `:BufferPrevious`, `:BufferClose` (mapped above)
- **Auto-session**: sessions auto-restore (`auto_restore_last_session = true`). Useful commands include `:SessionSave` / `:SessionRestore`
