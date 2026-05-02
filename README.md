# Neovim Config

## Setup

```sh
git clone https://github.com/nocturnalq/nvim-config.git ~/.config/nvim
```

Install vim-plug:

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Open Neovim and run `:PlugInstall`.

Install the `lazygit` binary (Homebrew: `brew install lazygit`).

---

## Plugin Audit

### Redundant / Overhead

| Plugin | Problem | Recommendation |
|--------|---------|----------------|
| `telescope.nvim` + `fzf-lua` | Both do fuzzy finding. Only `fzf-lua` is actually wired to keymaps — Telescope is dead weight. | **Remove `telescope.nvim`** (and `plenary.nvim` if nothing else needs it). |
| `vim-plug` | Synchronous, no lazy-loading, no lock file, comparatively slow startup. | **Migrate to `lazy.nvim`** — lazy-loading, lock file, faster startup, actively maintained. |
| `nvim-cmp` + `vsnip` | `vsnip` is referenced in `cmp_config.lua` but never installed as a plugin. The snippet expand function calls `vsnip#anonymous` which will silently fail. | **Either add `hrsh7th/vim-vsnip`** to `init.lua`, or switch the snippet engine to `luasnip` (more popular, better maintained). |
| `Comment.nvim` | Since **Neovim 0.10**, `gcc`/`gc` commenting is built-in (`vim.comment`). | **Remove `Comment.nvim`** if you're on Neovim ≥ 0.10. |
| `nanotech/jellybeans.vim` | Vim-era colorscheme, no treesitter highlight group support. | Consider **`rebelot/kanagawa.nvim`**, **`folke/tokyonight.nvim`**, or **`rose-pine/neovim`** — all have treesitter/LSP-aware highlight groups. |

### Solid, Keep

| Plugin | Notes |
|--------|-------|
| `nvim-tree.lua` | Good file explorer. |
| `nvim-web-devicons` | Required by nvim-tree, barbar, lualine. Keep. |
| `gitsigns.nvim` | Lightweight, fast git blame/hunk signs. |
| `barbar.nvim` | Tab/buffer bar. Works well with gitsigns integration you have configured. |
| `lualine.nvim` | Fast, highly configurable statusline. |
| `nvim-treesitter` | Essential for highlighting and text objects. Note: `ensure_installed = "all"` will download every grammar on first launch — consider listing only languages you use. |
| `nvim-lspconfig` + LSP stack | Clean modern setup using `vim.lsp.config`/`vim.lsp.enable` (Neovim 0.11+ API). |
| `nvim-cmp` + sources | Good completion setup. Fix the vsnip issue noted above. |
| `fzf-lua` | Fast, low-dependency fuzzy finder. Better performance than Telescope. |
| `lazygit.nvim` | Solid lazygit integration. |
| `auto-session` | Useful session persistence. |
| `trouble.nvim` | Good diagnostics UI. |

### Modern Alternatives Summary

| Current | Modern Alternative | Reason |
|---------|--------------------|--------|
| `vim-plug` | `lazy.nvim` | Lazy-loading, lock file, faster, actively maintained |
| `telescope.nvim` (unused) | Remove it | `fzf-lua` already covers all use cases |
| `Comment.nvim` | Built-in (Neovim ≥ 0.10) | No plugin needed |
| `jellybeans.vim` | `kanagawa.nvim` / `tokyonight.nvim` | Treesitter-aware highlight groups |
| `vim-vsnip` (missing) | `luasnip` | More features, wider community, better maintained |

---

## Keymaps

> **`<leader>`** is `\` by default (not explicitly set in this config).  
> **macOS Cmd-key** combos require terminal emulator support (e.g. WezTerm with custom keybindings that send the `<Char-0x..>` sequences used in `combinations.lua`).

### macOS Cmd-key (combinations.lua)

| Key | Action |
|-----|--------|
| `Cmd+S` | Save file |
| `Cmd+E` | Scroll down |
| `Cmd+Shift+E` | Scroll up |
| `Cmd+H` | Previous buffer (barbar) |
| `Cmd+L` | Next buffer (barbar) |
| `Cmd+W` | Close buffer (barbar) |
| `Cmd+T` | Reveal current file in tree |
| `Cmd+1` | Toggle file tree |
| `Cmd+[` | Toggle Trouble diagnostics |
| `Cmd+]` | Close Trouble |

### Clipboard (init.lua)

| Key | Mode | Action |
|-----|------|--------|
| `Cmd+C` | Normal, Visual | Copy to system clipboard |
| `Cmd+V` | Normal, Visual | Paste from system clipboard |
| `Cmd+V` | Insert | Paste from system clipboard |

### File Tree — nvim-tree (vimtree.lua)

| Key | Action |
|-----|--------|
| `Ctrl+N` | Toggle file tree |
| `<leader>e` | Focus file tree |

Inside the tree pane (nvim-tree defaults):

| Key | Action |
|-----|--------|
| `Enter` / `o` | Open file / expand directory |
| `a` | Create file/directory |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `p` | Paste |
| `y` | Copy filename |
| `Y` | Copy relative path |
| `gy` | Copy absolute path |
| `H` | Toggle hidden files |
| `R` | Refresh tree |
| `W` | Collapse all |
| `q` | Close tree |
| `g?` | Help |

### Fuzzy Finding — fzf-lua (telescope_config.lua)

| Key | Action |
|-----|--------|
| `<leader>f` | Find files |
| `<leader>g` | Live grep (search file contents) |

### Buffers — barbar (combinations.lua)

| Key | Action |
|-----|--------|
| `Cmd+H` | Previous buffer |
| `Cmd+L` | Next buffer |
| `Cmd+W` | Close current buffer |

barbar also supports buffer picking: `:BufferPick` (jump to any buffer by letter).

### Diagnostics — Trouble (trouble_config.lua + combinations.lua)

| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle Trouble |
| `<leader>xw` | Workspace diagnostics |
| `<leader>xd` | Document diagnostics |
| `<leader>xq` | Quickfix list |
| `<leader>xl` | Location list |
| `gR` | LSP references (Trouble view) |
| `Cmd+[` | Toggle diagnostics |
| `Cmd+]` | Close Trouble |

### LSP — Diagnostics (lsp/shared.lua)

| Key | Action |
|-----|--------|
| `<Space>e` | Open floating diagnostic |
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |
| `<Space>q` | Send diagnostics to location list |

### LSP — Buffer (lsp/shared.lua, active when LSP attaches)

| Key | Action |
|-----|--------|
| `gD` | Go to declaration |
| `gd` | Go to definition |
| `K` | Hover documentation |
| `gi` | Go to implementation |
| `Ctrl+K` | Signature help |
| `<Space>D` | Type definition |
| `<Space>rn` | Rename symbol |
| `<Space>ca` | Code action |
| `gr` | References |
| `<Space>f` | Format buffer |
| `<Space>wa` | Add workspace folder |
| `<Space>wr` | Remove workspace folder |
| `<Space>wl` | List workspace folders |

### Completion — nvim-cmp (cmp_config.lua)

| Key | Action |
|-----|--------|
| `Ctrl+Space` | Trigger completion |
| `Tab` | Next completion item / trigger completion |
| `Shift+Tab` | Previous completion item |
| `Enter` | Confirm selection |
| `Ctrl+E` | Abort completion |
| `Ctrl+B` | Scroll docs up |
| `Ctrl+F` | Scroll docs down |

### Commenting — Comment.nvim (comment_config.lua)

> **Note:** On Neovim ≥ 0.10 this is also built-in. These bindings are the Comment.nvim defaults.

| Key | Mode | Action |
|-----|------|--------|
| `gcc` | Normal | Toggle line comment |
| `gc` + motion | Normal | Comment over motion (e.g. `gcj`, `gc3j`, `gcap`) |
| `gc` | Visual | Toggle comment for selection |
| `gbc` | Normal | Toggle block comment |
| `gb` + motion | Normal | Block comment over motion |

### Git — LazyGit (lazygit_config.lua)

| Key | Action |
|-----|--------|
| `<leader>gg` | Open LazyGit |

Inside LazyGit (terminal UI — not Neovim keymaps):

| Key | Action |
|-----|--------|
| `Space` | Stage/unstage file |
| `c` | Commit |
| `P` | Push |
| `p` | Pull |
| `b` | Branches |
| `?` | Help |
| `q` | Quit |

### Session — auto-session

No keymaps set. Use commands:

| Command | Action |
|---------|--------|
| `:SessionSave` | Save current session |
| `:SessionRestore` | Restore session for cwd |
| `:SessionDelete` | Delete session for cwd |
| `:Autosession search` | Browse/restore sessions |

---

## LSP Servers

| Language | Server | Install |
|----------|--------|---------|
| Go | `gopls` | `go install golang.org/x/tools/gopls@latest` |
| Python | `pyright` | `npm install -g pyright` or `brew install pyright` |
| Zig | `zls` | `brew install zls` or build from source |
