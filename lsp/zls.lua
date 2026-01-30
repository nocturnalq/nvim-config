---@brief
--- https://github.com/zigtools/zls
---
--- Zig LSP implementation + Zig Language Server

local shared = require('lsp.shared')

vim.lsp.config('zls', {
  on_attach = shared.on_attach,
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  },
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
  cmd = { 'zls' },
  filetypes = { 'zig', 'zir' },
  root_markers = { 'zls.json', 'build.zig', '.git' },
  workspace_required = false,
})
