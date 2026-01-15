local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('rebelot/kanagawa.nvim')
Plug('kyazdani42/nvim-tree.lua')
Plug('kyazdani42/nvim-web-devicons')
Plug ('lewis6991/gitsigns.nvim') -- OPTIONAL: for git status
Plug ('romgrk/barbar.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-buffer') 
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline') 
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp' ) 
Plug('hrsh7th/cmp-nvim-lsp-signature-help')
-- Telescope
Plug('nvim-lua/plenary.nvim') --for fzf
Plug('nvim-telescope/telescope.nvim', { [ 'tag' ] = 'v0.2.1' })
Plug('ibhagwan/fzf-lua', {['branch'] = 'main'})

-- LazyGit (requires lazygit binary installed)
Plug('kdheepak/lazygit.nvim')

-- Autosession
Plug('rmagatti/auto-session')

-- Comment 
Plug('numToStr/Comment.nvim')

-- Trouble
Plug('folke/trouble.nvim')

vim.call('plug#end')


home=os.getenv("HOME")
package.path = home .. "/.config/nvim/?.lua;" .. package.path

-- LSP configs
-- Load LSP configurations from lsp/ directory
require"lsp.shared"  -- Load shared settings first
require"lsp.gopls"
require"lsp.pyright"

-- Enable the language servers
vim.lsp.enable('pyright')
vim.lsp.enable('gopls')

require"common"
require"theme"
require"vimtree"
require"barbar"
require"lua_line"
require"nvim-treesitter"
require"cmp_config"
require"telescope_config"
require"lazygit_config"
require"autosession"
require"comment_config"
require"combinations"
require"trouble_config"
