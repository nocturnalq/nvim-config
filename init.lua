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
