-- gopls LSP configuration
local shared = require('lsp.shared')

vim.lsp.config('gopls', {
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
  }
})
